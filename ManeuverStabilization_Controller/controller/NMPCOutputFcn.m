function y = NMPCOutputFcn(x, u)
    % Extract only position states [px, py, pz]
    y = x(1:9);  
end