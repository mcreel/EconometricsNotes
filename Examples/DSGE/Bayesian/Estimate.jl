using Dynare, Serialization, Statistics

context = @dynare "CK.mod"

chain = deserialize("CK/output/mcmc_chain_1.jls")
mean(chain.value[:,1:end-1],dims=1)
