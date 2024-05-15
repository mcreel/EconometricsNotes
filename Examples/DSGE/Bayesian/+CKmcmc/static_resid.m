function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = CKmcmc.static_resid_tt(T, y, x, params);
end
residual = zeros(11, 1);
    residual(1) = (y(8)) - (y(2)^(-params(4)));
    residual(2) = (y(9)) - (params(10)*exp(y(7)));
    residual(3) = (y(10)) - (T(1)*T(2));
    residual(4) = (y(11)) - (exp(y(6))*(1-params(1))*T(3)*T(4));
    residual(5) = (y(8)) - (y(8)*params(2)*(1+y(10)-params(3)));
    residual(6) = (y(9)/y(8)) - (y(11));
    residual(7) = (y(6)) - (y(6)*params(6)+params(7)*x(1));
    residual(8) = (y(7)) - (y(7)*params(8)+params(9)*x(2));
    residual(9) = (y(1)) - (T(2)*exp(y(6))*T(3));
    residual(10) = (y(5)) - (y(1)-y(2));
    residual(11) = (y(3)) - (y(5)+y(3)*(1-params(3)));

end
