% This will compare ode45 vs rk4sys

tspan = [0 2];

% h = 1e-5;

x0 = [0; 0; 0];

% Solve using our rk4 func
% [t_rk4, x_rk4] = rk4(@circuitODEs, tspan, x0, h);

% Solve using ode45
% options = odeset('RelTol',1e-4, 'AbsTol', 1e-6);
[t_ode45, x_ode45] = ode45(@circuitODEs, tspan, x0);


% Plot the results
figure;
subplot(3,1,1);
plot(t_ode45, x_ode45(:,1), 'b.-', 'MarkerSize', 10);
xlabel('Time (s)');
ylabel('\phi_1');
title('Comparison: ode45 (relaxed tolerances)');
grid on;

subplot(3,1,2);
plot(t_ode45, x_ode45(:,2), 'r.-', 'MarkerSize', 10);
xlabel('Time (s)');
ylabel('i_2 (A)');
title('Current i_2 vs Time');
grid on;

subplot(3,1,3);
plot(t_ode45, x_ode45(:,3), 'k.-', 'MarkerSize', 10);
xlabel('Time (s)');
ylabel('V_c (V)');
title('Capacitor Voltage V_c vs Time');
grid on;