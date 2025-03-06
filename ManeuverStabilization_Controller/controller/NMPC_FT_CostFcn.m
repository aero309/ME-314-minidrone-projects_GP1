function J = NMPC_FT_CostFcn(X,U,data)
    %[px py pz qw qx qy qz vx vy vz wx wy wz T1 T2 T3 T4]
    %[1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17]
    Qpx = 80;
    Qpy = 80;
    Qpz = 800;
    Qx = 60;
    Qy = 60;
    Qwx = .5;
    Qwz = 0.1;
    Qt = 3.;
    Qv = 1.;
    Qu = 1.;
    qxy = (1/norm([X(4:6) 0])) * [X(4:6) 0];
    qz = (1/norm([X(4) 0 0 X(7)])) * [X(4) 0 0 X(7)];
    uref = 237 * ones(1, 4);
    tref = 237 * ones(1, 4);
    current_y = [X(1:3) 0 0 X(8:17) U];
    yref = [data.Reference, tref, uref];
    y = current_y - yref + [zeros(1,3), qxy(2)^2 + qxy(3)^2, qxy(4), zeros(1,14)];
    Usquared = 0;
    for i = 1:4
        Usquared[]
    end
end

