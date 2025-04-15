% A simple test script for the circuitODEs function

tspan = [0 0.1];

% Define the initial conditions:
x0 = [0; 0; 0];

% Solve the ODE system using ode45
[t, x] = ode45(@circuitODEs, tspan, x0);

% Plot the results for each state variable

figure;
subplot(3,1,1);
plot(t, x(:,1),'r','LineWidth',1.5);
xlabel('Time (s)');
ylabel('\phi_1');
title('Flux \phi_1 vs Time');
grid on;

subplot(3,1,2);
plot(t, x(:,2),'g','LineWidth',1.5);
xlabel('Time (s)');
ylabel('i_2 (A)');
title('Inductor/Branch Current i_2 vs Time');
grid on;

subplot(3,1,3);
plot(t, x(:,3),'b','LineWidth',1.5);
xlabel('Time (s)');
ylabel('V_c (V)');
title('Capacitor Voltage V_c vs Time');
grid on;
