phi = [-3.8, -2.7, -1.3, 0.1, 1.5, 2.5, 3.7];
Il = [-1.998, -1.982, -1.723, 0.199, 1.811, 1.973, 1.997];

V = [-135, 140, 290, 350, 425];
Id = [-3000, 200, 80, 110, 500];

y = [];
x = [];
y2= [];
x2= [];

for i = -5:1e-5:5
    if abs(i) >= 4
        y(end + 1) = 2 * (i/abs(i));
    else
        y(end + 1) = newton(phi, Il, i);
    end

    x(end + 1) = i;
end

for i = -150:20:470
    y2(end + 1) = newton(V, Id, i);
    x2(end + 1) = i;

end

tspan = [0 2];
x0 = [0; 0; 0];
h = 1e-5;

[t_rk4, x_rk4] = rk4sys(@circuitODEs, tspan, x0, h);
[t45, x45] = ode45(@circuitODEs,tspan, x0);
Vout = [];

for i = i:x_rk4(:, 2)
    disp(i);
end

disp(Vout);
fig1 = figure(1);
subplot(2, 1, 1);
plot(x, y);
title("Interpolation plot for phi");
xlabel("Phi");
ylabel("Current");

subplot(2,1,2);
plot(x2, y2);
title("Interpolation plot for Id");
xlabel("Voltage (mV");
ylabel("Current (micro amps)");

fig2 = figure(2);
subplot(2,1,1);
plot(t_rk4, x_rk4);
legend('dphi/dt', 'di/dt', 'dv/dt');
title("rk4");

subplot(2,1,2);
plot(t45, x45);
legend('dphi/dt', 'di/dt', 'dv/dt');
title("ODE45");
