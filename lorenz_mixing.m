clear all
close all

%% Setup parameters and initial conditions

% param = [sigma, rho, beta]
param = [10, 28, 8/3];   % lorenz, deterministic nonperiodic flow

n = 1000;  % do 1,000 points uniformly distributed in a volume 
dV = 0.05;  % with sides +/-dV, i.e. (2*dV)^3

IC = rand(n*3, 1)*(dV*2) - dV;
% And move half of them so we have two widely-separated sets
for i=1:n/2
    IC([0*n+i, 1*n+i, 2*n+i]) = IC([0*n+i, 1*n+i, 2*n+i]) + [10 7 -8]';
end

%% de-interleave the initial points for easy plotting
X_init = zeros(n, 3);
for i=1:n
   X_init(i, :) = IC([0*n+i, 1*n+i, 2*n+i]);
end

%% Integrate system
Tau = 400;
[t, X] = ode45(@lorenz_parallel, [0, Tau], IC, [], param);

%% de-interleave the final points for easy plotting
X_final = zeros(n, 3);
for i=1:n
   X_final(i, :) = X([0*n+i, 1*n+i, 2*n+i]);
end

hold on
plot3(X_init(1:n/2,1), X_init(1:n/2,2), X_init(1:n/2,3), 'redX')
plot3(X_init(n/2+1:end,1), X_init(n/2+1:end,2), X_init(n/2+1:end,3), 'bluX')

plot3(X_final(1:n/2,1), X_final(1:n/2,2), X_final(1:n/2,3), 'gre.')
plot3(X_final(n/2+1:end,1), X_final(n/2+1:end,2), X_final(n/2+1:end,3), 'bla.')

title(sprintf('Mixing in lorenz system after \\tau = %f s', Tau));
legend('Initial set (1)', 'Initial set (2)', 'Final set (1)', 'Final set (2)');
xlabel('x'); ylabel('y'); zlabel('z');