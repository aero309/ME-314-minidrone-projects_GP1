function F = StateJacobianFcn(~,~)
    % State Transition Jacobian for EKF
    Ts = 0.005;
    F = [1, Ts,  0;
        0,  1, -Ts;
        0,  0,  1];
end