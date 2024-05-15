function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(6, 1);
end
[T_order, T] = CKmcmc.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(28, 1);
g1_v(1)=1;
g1_v(2)=(-1);
g1_v(3)=(-(getPowerDeriv(y(2),(-params(4)),1)));
g1_v(4)=1;
g1_v(5)=(-(T(2)*params(1)*exp(y(6))*getPowerDeriv(y(3),params(1)-1,1)));
g1_v(6)=(-(T(4)*exp(y(6))*(1-params(1))*T(5)));
g1_v(7)=(-(T(2)*exp(y(6))*T(5)));
g1_v(8)=1-(1-params(3));
g1_v(9)=(-(T(1)*T(6)));
g1_v(10)=(-(exp(y(6))*(1-params(1))*T(3)*getPowerDeriv(y(4),(-params(1)),1)));
g1_v(11)=(-(exp(y(6))*T(3)*T(6)));
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=(-(T(1)*T(2)));
g1_v(15)=(-(exp(y(6))*(1-params(1))*T(3)*T(4)));
g1_v(16)=1-params(6);
g1_v(17)=(-(T(2)*exp(y(6))*T(3)));
g1_v(18)=(-(params(10)*exp(y(7))));
g1_v(19)=1-params(8);
g1_v(20)=1;
g1_v(21)=1-params(2)*(1+y(10)-params(3));
g1_v(22)=(-y(9))/(y(8)*y(8));
g1_v(23)=1;
g1_v(24)=1/y(8);
g1_v(25)=1;
g1_v(26)=(-(y(8)*params(2)));
g1_v(27)=1;
g1_v(28)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 11, 11);
end
