function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(17)=params(6)*y(6)+params(7)*x(1);
  y(18)=params(8)*y(7)+params(9)*x(2);
  T(1)=params(10)*exp(y(18));
  y(20)=T(1);
end
