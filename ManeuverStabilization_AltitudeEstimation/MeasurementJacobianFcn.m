function H = MeasurementJacobianFcn(~)
    % Measurement Jacobian for EKF
    H = [1, 0, 0]; 
end