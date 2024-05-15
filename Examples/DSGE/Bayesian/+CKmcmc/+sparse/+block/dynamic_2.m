function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  y(16)=y(12)-y(13);
  T(2)=exp(y(17));
  T(3)=y(3)^params(1);
  T(4)=y(15)^(-params(1));
  residual(1)=(y(22))-(T(2)*(1-params(1))*T(3)*T(4));
  residual(2)=(y(20)/y(19))-(y(22));
  residual(3)=(y(19))-(y(13)^(-params(4)));
  T(5)=y(15)^(1-params(1));
  residual(4)=(y(12))-(T(5)*T(2)*T(3));
  residual(5)=(y(14))-(y(16)+y(3)*(1-params(3)));
  residual(6)=(y(19))-(params(2)*y(30)*(1+y(32)-params(3)));
  T(6)=params(1)*T(2)*y(3)^(params(1)-1);
  residual(7)=(y(21))-(T(6)*T(5));
  T(7)=getPowerDeriv(y(3),params(1),1);
  T(8)=getPowerDeriv(y(15),1-params(1),1);
if nargout > 3
    g1_v = NaN(20, 1);
g1_v(1)=(-(T(4)*T(2)*(1-params(1))*T(7)));
g1_v(2)=(-(T(5)*T(2)*T(7)));
g1_v(3)=(-(1-params(3)));
g1_v(4)=(-(T(5)*params(1)*T(2)*getPowerDeriv(y(3),params(1)-1,1)));
g1_v(5)=(-(T(2)*(1-params(1))*T(3)*getPowerDeriv(y(15),(-params(1)),1)));
g1_v(6)=(-(T(2)*T(3)*T(8)));
g1_v(7)=(-(T(6)*T(8)));
g1_v(8)=1;
g1_v(9)=(-1);
g1_v(10)=(-(getPowerDeriv(y(13),(-params(4)),1)));
g1_v(11)=1;
g1_v(12)=1;
g1_v(13)=(-1);
g1_v(14)=1;
g1_v(15)=(-y(20))/(y(19)*y(19));
g1_v(16)=1;
g1_v(17)=1;
g1_v(18)=1;
g1_v(19)=(-(params(2)*(1+y(32)-params(3))));
g1_v(20)=(-(params(2)*y(30)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
