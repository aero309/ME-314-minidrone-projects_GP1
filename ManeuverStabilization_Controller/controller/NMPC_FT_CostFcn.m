function J = NMPC_FT_CostFcn(X,U,e,data)
    %[px py pz qw qx qy qz vx vy vz wx wy wz]
    %[1  2  3  4  5  6  7  8  9  10 11 12 13]

    %[px py pz vx vy vz wx wy wz]
    %[1  2  3  4  5  6  7  8  9]
    Qpxy = 80;
    Qpz = 800;
    Qv = 1;
    Qwxy = 0.5;
    Qwz = 0.1;
    Qt = 10000;
    tref = 0.1545075 * ones(1, 4);
    N = data.PredictionHorizon;
    J = 0;
    Q = diag([Qpxy, Qpxy , Qpz, Qv, Qv, Qv, Qwxy, Qwxy, Qwz, Qt, Qt, Qt, Qt]);
    for i = 1: N-1
        qxy = (1/norm([X(i,4:6) 0])) * [X(i,4:6) 0];
        qz = (1/norm([X(i,4),0, 0, X(i,7)])) * [X(i,4), 0, 0, X(i,7)];
        current_y = [X(i,1:3), X(i,8:13), U(i, :)];
        yref = [data.References(i, 1:9), tref]; %add 2 zeros
        y = current_y - yref;
        J = J + U(i, :) * U(i, :)' + y*Q*y';
    end
    qxy = (1/norm([X(N,4:6) 0])) * [X(N,4:6) 0];
    qz = (1/norm([X(N,4),0, 0, X(i,7)])) * [X(N,4), 0, 0, X(N,7)];
    current_y = [X(N,1:3), X(i,8:13), U(i, :)];
    yref = [data.References(N, 1:9), tref]; %add 2 zeros
    y = current_y - yref + [zeros(1,3), zeros(1,10)];
    J = J + y*Q*y';
end

