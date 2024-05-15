function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(1) = params(1)*exp(y(6))*y(3)^(params(1)-1);
T(2) = y(4)^(1-params(1));
T(3) = y(3)^params(1);
T(4) = y(4)^(-params(1));
end
