function J = CostFcn(X, U, e, data)
    Ts = 0.05;
    g = 9.81;
    N = data.PredictionHorizon;
    QN = diag([1, 0, 1, 0]);
    z_offset = 0.5 * g * (Ts * N) ^ 2;
    x_ref = data.References(end, :);
    x_ref(3) = x_ref(3) + z_offset;
    errN = X(N, :) - x_ref;
    J = errN * QN * errN';
end

