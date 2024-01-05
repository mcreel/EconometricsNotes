#= 

This is written to be used interactively, with VScode, to explain the
methods, step by step. For good performance, it is better to wrap 
everything into a function. See the example in the DSGE directory of
https://github.com/mcreel/SNM  for how to do that.

Start julia as "julia --proj -t auto" to use threads

=#
using Pkg
cd(@__DIR__)
#Pkg.activate(".")
using Econometrics, SimulatedNeuralMoments, Flux, SolveDSGE, MCMCChains
using Distributions, StatsPlots, DelimitedFiles, PrettyTables
using BSON:@save
using BSON:@load


## get the things to define the structure for the model
include("CKlib.jl") # contains the functions for the DSGE model
@load "neuralmodel.bson" nnmodel nninfo # use this to load a trained net

## fill in the structure that defines the model
n = 160
lb, ub = PriorSupport()
model = SNMmodel("DSGE example", n, lb, ub, GoodData, InSupport, Prior, PriorDraw, auxstat)

## see how the NN estimator works with some random parameter draws
for  i = 1:10
# generate some date and define the neural moments using the data
θtrue = PriorDraw()
data = dgp(θtrue, dsge, 1, rand(1:Int64(1e10)))[1]
if GoodData(auxstat(data))
    θnn = NeuralMoments(auxstat(data), model, nnmodel, nninfo)[:]
    pretty_table([θtrue θnn],header = (["θtrue", "θnn"]))
else
    i -=1
end
end

## Now, let's move on to Bayesian MSM
data = readdlm("dsgedata.txt")
θtrue = TrueParameters() # the parameters of the example data
#data = dgp(θtrue, dsge, 1, rand(1:Int64(1e10)))[1]


#=
# UNCOMMENT this block to see training of the net, using a small sample
## train the net, and save it and the transformation info
TrainTestSize = 50000
Epochs = 1000
nnmodel, nninfo, params, stats, transf_stats = MakeNeuralMoments(model, TrainTestSize=TrainTestSize, Epochs=Epochs)
# examine the transformed stats to ensure that outliers
# have been controlled. We want to see some distance between the whiskers.
@info "checking the transformed statistics for outliers"
for i = 1:size(transf_stats,2)
    boxplot(transf_stats[:,i],title="statistic $i")
    savefig("stat$i.png")
end
@save "neuralmodel.bson" nnmodel nninfo
=#

## get the NN estimate from the data, using the trained net
θnn = NeuralMoments(auxstat(data), model, nnmodel, nninfo)[:]
@show θnn

## settings for MCMC
S = 50
covreps = 1000
tuninglength = 500
finallength = 1000
burnin = 100
verbosity = 100 # show results every X draws
tuning = 1.0

## define the proposal and the log-likelihood
junk, Σp = mΣ(θnn, covreps, model, nnmodel, nninfo)
while !isposdef(Σp)
    for i = 1:size(Σp,1)
        Σp[i,i] += 1e-5
    end
end    
proposal(θ) = rand(MvNormal(θ, tuning*Σp))
lnL = θ -> snmobj(θ, θnn, S, model, nnmodel, nninfo)

## run a short chain to improve proposal
# tuning the chain and creating a good proposal may
# need care - this is just an example!
chain = SimulatedNeuralMoments.mcmc(θnn, tuninglength, lnL, model, nnmodel, nninfo, proposal, burnin, verbosity)
acceptance = mean(chain[:,end])
start = 0.

## update proposal until acceptance rate is good
while acceptance < 0.2 || acceptance > 0.3
    global tuning, chain, acceptance, start
    acceptance < 0.2 ? tuning *= 0.75 : nothing
    acceptance > 0.3 ? tuning *= 1.5 : nothing
    proposal(θ) = rand(MvNormal(θ, tuning*Σp))
    start = mean(chain[:,1:end-2], dims=1)[:]
    chain = SimulatedNeuralMoments.mcmc(start, tuninglength, lnL, model, nnmodel, nninfo, proposal, burnin, verbosity)
    acceptance = mean(chain[:,end])
end

## final long chain
start = mean(chain[:,1:end-2], dims=1)[:]
chain = SimulatedNeuralMoments.mcmc(start, finallength, lnL, model, nnmodel, nninfo, proposal, burnin, verbosity)

## visualize results
chn = Chains(chain[:,1:end-2], ["β", "γ", "ρ₁", "σ₁", "ρ₂", "σ₂", "nss"])
plot(chn)
#savefig("chain.png") # saved one used 5000 draws, current settings are fewer
pretty_table([θtrue θnn mean(chain[:,1:end-2],dims=1)[:]], header = (["θtrue", "θnn", "θmcmc"]))
display(chn)

