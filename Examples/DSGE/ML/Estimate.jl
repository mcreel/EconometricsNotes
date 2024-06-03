using Dynare

cd(@__DIR__)

context = @dynare "ML.mod" ;
; # don't want to see all that output
