%% Lorenz system ODE

function xyzdot = lorenz_ode(t, xyz, param)
    % param = [sigma, rho, beta]
    xyzdot = zeros(3,1);
    xyzdot(1) = param(1)*(xyz(2) - xyz(1));
    xyzdot(2) = xyz(1)*(param(2)-xyz(3)) - xyz(2);
    xyzdot(3) = xyz(1)*xyz(2) - param(3)*xyz(3);
end
