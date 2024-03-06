# This does raw TCN neural net estimation for the DSGE example,
# doing 1000 Monte Carlo replications
#
# In the future, it would be nice to show how to do Bayesian MSM
using PrettyTables, Pkg
cd(@__DIR__)
Pkg.activate(".")
# defines the net and the DSGE model, and needed functions
include("Setup.jl")
 
function main()
reps = 1000
net = load_trained()
Flux.testmode!(net)
θtrue = TrueParameters()
@time data = MakeData(θtrue, reps, CKmodel)
@time θnn = Float64.(UntransformParameters(net(data)))
m = mean(θnn, dims=2)
e = θnn .- TrueParameters()
s = std(e, dims=2)
b = mean(e, dims=2)
r = sqrt.(mean(e.^2, dims=2))
printstyled("Monte Carlo TCN neural net results for the DSGE model, $(reps) replications\n", color=:green)
pretty_table(round.([TrueParameters() m b s r],digits=4), header=["True", "mean", "bias", "st. dev.", "rmse"])
return nothing
#=
# set up proposal
covreps = 1000
_,Σₚ = simmomentscov(net, dgp, covreps, θnn)
δ = 1.0 # tuning

# do MCMC
S = 40 # simulations to compute moments
# initial short chain
chain = mcmc(θnn, θnn, δ, Σₚ, S, net, dgp; burnin=0, chainlength=200)
accept = mean(chain[:,end-1])
# loop to get good tuning
while accept < 0.2 || accept > 0.3
    accept < 0.2 ? δ *= 0.75 : nothing
    accept > 0.3 ? δ *= 1.5 : nothing
    chain = mcmc(θnn, θnn, δ, Σₚ, S, net, dgp; burnin=0, chainlength=200)
    accept = mean(chain[:,end-1])
end
# final long chain
chain = mcmc(θnn, θnn, δ, Σₚ, S, net, dgp; burnin=0, chainlength=2000)
# report results
chn = Chains(chain[:,1:end-2], ["θ₁", "θ₂"])
plot(chn)
savefig("chain.png")
pretty_table([θtrue[:] Float64.(θnn[:]) mean(chain[:,1:end-2],dims=1)[:]], header = (["θtrue", "θnn", "θpos_mean"]))
display(chn)
=#
end
main();
