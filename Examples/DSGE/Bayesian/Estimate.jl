using Dynare

context = @dynare "CKmcmc_cn.mod"

results = context.results.model_results[1]
results.estimation.posterior_mode
