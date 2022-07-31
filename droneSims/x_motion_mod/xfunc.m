
function dxdt = xfunc(t,x,F_x,M)

%{
    F_x is force in the x-direction
%}

% dxdt = [x(2); F_x/M]; % no drag foce included

% Constants
rho = 1.225; % kg/m^3 density of the air. Using density at sea level.
C_d = 0.5; % coefficient of drag (approximated 0.5)
A = 0.3*0.09; % m^2 cross sectional area of drone

% State Space Form
dxdt = [x(2); F_x/M-(1/M)*rho*C_d*A*x(2)^2]; % added x-direction Drag Force 
end