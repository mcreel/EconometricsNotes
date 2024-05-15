function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = CKmcmc.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 6
    T = [T; NaN(6 - size(T, 1), 1)];
end
T(5) = getPowerDeriv(y(3),params(1),1);
T(6) = getPowerDeriv(y(4),1-params(1),1);
end
