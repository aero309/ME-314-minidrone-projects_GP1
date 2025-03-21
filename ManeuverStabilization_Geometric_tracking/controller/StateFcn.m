function xk1 = StateFcn(xk, uk)
    m = 0.063;
    Ts = 0.005;
    A = [1, Ts, 0, 0; ...
        0, 1, 0, 0; ...
        0, 0, 1, Ts; ...
        0, 0, 0, 1];
    B = [0; 0; (Ts^2)/(2*m); Ts/m];
    xk1 = A*xk + B*uk;
end
