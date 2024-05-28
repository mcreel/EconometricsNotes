using Dynare, Serialization, Statistics

context = @dynare "CKmcmc_cn.mod"

chain = deserialize("CKmcmc_cn/output/mcmc_chain_1.jls")
mean(chain.value[:,1:end-1],dims=1)
