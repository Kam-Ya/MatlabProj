% circuitODEs.m
% Returns a column vector of values from our system at t
% with the state variables provided to it
function dxdt = circuitODEs(t, x)
    % x is a column vector of state variables phi1, i2, Vc
    phi1 = x(1);
    i2 = x(2);
    Vc = x(3);
    
    % Constants
    R1 = 3;
    R2 = 2;
    L2 = 1e-3;  % 1 mH = 0.001 H
    c = 1e-3;  % 1 mF = 0.001 F

    Vs = 10*sin(20*pi*t); % Source Voltage
    
    % ODEs
    dphi1_dt = R1 * phi1 - Vc + Vs; % i1 = f_phi1
    di2_dt = (Vc - R2 * i2) / L2;
    dVc_dt = (phi1 - Vc -i2) / c; % g_(Vc) * c = iD, newton of 2nd data set
    
    dxdt = [dphi1_dt; di2_dt; dVc_dt];
end