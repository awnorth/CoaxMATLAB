% Function to solve for force in x direction
% Andrew North 7/18/2022

%{
This function solves for the net force in the x direction
given inputs of phi (from gyroscope) and sigma (from servo angle given by 
potentiometers)
%}

function Fn1 = x_force(phi,m1,m2)

% phi = (5*pi/180); % phi comes from gyroscope
% sigma = pi-(10*pi/180); % sigma is the servo angle, comes from potentiometers 

M = m1+m2;
g = 9.81; % m/s^2
Fn2 = M*g; % force in y direction

F_thrust = Fn2/sin(phi); % balances y-axis forces so no motion in the y direction

Fn1 = F_thrust*cos(phi); % From rotation matrix, solving for force in x direction



end



