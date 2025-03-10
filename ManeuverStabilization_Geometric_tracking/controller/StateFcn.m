function dxdt = StateFcn(x, u)
    m = 0.063;
    Ts = 0.05;
    A = [1, Ts, 0, 0; ...
        0, 1, Ts, 0; ...
        0, 0, 1, Ts; ...
        0, 0, 0, 1];
    B = [0; 0; (Ts^2)/(2*m); Ts/m];
    dxdt = A*x + B*u;
end
