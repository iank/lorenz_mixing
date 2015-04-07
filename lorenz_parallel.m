%% Vectorized lorenz system (for computing simultaneous trajectories)

function xyzdot = lorenz_parallel(t, xyz, param)
    % param = [sigma, rho, beta]
    % n is # of simultaneous systems
    n = length(xyz)/3;  % had best be divisible..
    
    x = xyz(1:n);
    y = xyz(n+1:2*n);
    z = xyz(2*n+1:3*n);
    
    xyzdot = zeros(3*n,1);
    xyzdot(1:n) = param(1)*(y - x);
    xyzdot(n+1:2*n) = x.*(param(2)-z) - y;
    xyzdot(2*n+1:3*n) = x.*y - param(3)*z;
end
    
