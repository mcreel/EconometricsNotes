# Estimates the Klein consumption equation by 2SLS
using Econometrics, DelimitedFiles, Statistics

	
function main()
cd(@__DIR__)
data = readdlm("klein.data")
# construct missing lags, and drop first row that has missing data
profits = data[:,3]
output = data[:,7]
data = [data lag(profits,1) lag(output,1)]
data = data[2:end,:]
n = size(data,1)
# define instruments
exogs = [1, 6, 8, 9, 10, 11, 12]
exogs = data[:,exogs]
exogs = [ones(n,1) exogs]

# CONSUMPTION
println("CONSUMPTION EQUATION")
# define variables in consumption equation
y = data[:,2]
profits = data[:,3]
lagprofits = data[:,11]
wp = data[:,4]
wg = data[:,8]
wages = wp + wg
# regressors in consumption equation
x = [profits lagprofits wages]
x = [ones(n,1) x]
# 2SLS estimation
names = ["Constant", "Profits", "Profits-1", "Wages"]
tsls(y, x, exogs; names=names)
printstyled("\nNote that 2SLS does not give the same results as does GMM.\n", color=:green)
printstyled("This is because the equation is overidentified. GMM is\n", color=:green)
printstyled("using an estimate of the efficient weight matrix. 2SLS does not.\n", color=:green)

return
end
main()
