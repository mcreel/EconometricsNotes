function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(8, 1);
  T(1)=exp(y(6));
  T(2)=y(3)^params(1);
  T(3)=y(4)^(-params(1));
  residual(1)=(y(11))-(T(1)*(1-params(1))*T(2)*T(3));
  residual(2)=(y(8))-(y(8)*params(2)*(1+y(10)-params(3)));
  residual(3)=(y(9)/y(8))-(y(11));
  residual(4)=(y(8))-(y(2)^(-params(4)));
  T(4)=params(1)*T(1)*y(3)^(params(1)-1);
  T(5)=y(4)^(1-params(1));
  residual(5)=(y(10))-(T(4)*T(5));
  residual(6)=(y(1))-(T(5)*T(1)*T(2));
  residual(7)=(y(5))-(y(1)-y(2));
  residual(8)=(y(3))-(y(5)+y(3)*(1-params(3)));
  T(6)=getPowerDeriv(y(3),params(1),1);
  T(7)=getPowerDeriv(y(4),1-params(1),1);
if nargout > 3
    g1_v = NaN(20, 1);
g1_v(1)=(-(T(3)*T(1)*(1-params(1))*T(6)));
g1_v(2)=(-(T(5)*params(1)*T(1)*getPowerDeriv(y(3),params(1)-1,1)));
g1_v(3)=(-(T(5)*T(1)*T(6)));
g1_v(4)=1-(1-params(3));
g1_v(5)=1-params(2)*(1+y(10)-params(3));
g1_v(6)=(-y(9))/(y(8)*y(8));
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(getPowerDeriv(y(2),(-params(4)),1)));
g1_v(11)=1;
g1_v(12)=(-(y(8)*params(2)));
g1_v(13)=1;
g1_v(14)=(-(T(1)*(1-params(1))*T(2)*getPowerDeriv(y(4),(-params(1)),1)));
g1_v(15)=(-(T(4)*T(7)));
g1_v(16)=(-(T(1)*T(2)*T(7)));
g1_v(17)=1;
g1_v(18)=(-1);
g1_v(19)=1;
g1_v(20)=(-1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
end
