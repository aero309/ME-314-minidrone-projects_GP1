function y = MeasurementFcn(x)
    z = x(1);  % Altitude from state

    % Return all measurements as a vector
    y = z;
end