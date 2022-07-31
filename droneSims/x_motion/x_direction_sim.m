% Andrew North 7/18/2022

% Constants:
L1 = 0.05; %m
L3 = 0.1; %m

% Variables:
psi = pi-pi/20;
psi_degree = psi*180/pi;

% Calculate theta (measure against gyroscope)
theta = atan((sin(psi))/((L3/L1)-cos(psi)));
theta_degree = theta*180/pi;

% Calculate phi (thrust vector)
phi = theta + psi - pi/2;
phi_degree = phi*180/pi;



phi = (1*pi/180); % phi comes from gyroscope
psi = pi-(2*pi/180); % psi is the servo angle, comes from potentiometers 


F_x = x_force(phi,psi); % force in x-direction

M = 1; % kg

% tspan = [0 5];
% x0 = [0;0];
% [t,x] = ode45(@xfunc,tspan,x0);


tspan = [0 5];
x0 = [0;0];
[t,x] = ode45(@(t,x) xfunc(t,x,F_x,M),tspan,x0);

plot(t,x(:,1),t,x(:,2))
title('x position vs. time');
xlabel('time (seconds)');
ylabel('x-position (meters)');
legend('postion','velocity');

for k=1:length(t)
    drawdrone(x(k,:));
end

