clear all
close all

% param = [sigma, rho, beta]
param = [10, 28, 8/3];   % lorenz, deterministic nonperiodic flow

IC = [0.1, 0.1, 0.1];  % ??

[t, X] = ode45(@lorenz_ode, [0, 40], IC, [], param);

figure
plot3(X(:,1), X(:,2), X(:,3))
xlabel('x');
ylabel('y');
zlabel('z');
title(sprintf('Lorenz attractor \\sigma = %f, \\rho = %f, \\beta = %f', param(1), param(2), param(3)));
