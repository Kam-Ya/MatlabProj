% This will compare ode45 vs rk4sys

tspan = [0 2];

h = 1e-5;

x0 = [0; 0; 0];

% Solve using our rk4 func
[t_rk4, x_rk4] = rk4sys(@circuitODEs, tspan, x0, h);

% Solve using ode45
% options = odeset('RelTol',1e-4, 'AbsTol', 1e-6);
[t_ode45, x_ode45] = ode45(@circuitODEs, tspan, x0);



% Interpolate rk4 to match ode45 time points
x_rk4_interp = interp1(t_rk4, x_rk4, t_ode45);


% Interpolate RK4 results at ode45 time points
x_rk4_interp = interp1(t_rk4, x_rk4, t_ode45);

% Compute estimated absolute error
abs_error = abs(x_ode45 - x_rk4_interp);

% Plot error for each component
figure;
plot(t_ode45, abs_error);
legend('x(1) error','x(2) error','x(3) error');
xlabel('Time'); ylabel('Absolute Error');
title('Estimated Error Between rk4sys and ode45');
