function x_next = StateTransitionFcn(x, u)
    z = x(1);           
    dz = x(2); 
    bias_acc = x(3);
    Ts = 0.005;
    ddz = u(1);         % Vertical acceleration from IMU
    % Time step update
    z_next = z + dz * Ts;
    dz_next = dz + (ddz-bias_acc)* Ts; % Bias assumed constant
    bias_acc_next = bias_acc;
    x_next = [z_next; dz_next; bias_acc_next];
end