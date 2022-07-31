% Lab 7
% ----- Cart/Pendulum simulation ----- %
clear all, close all, clc

% a) Cart and Pendulum parameters
m1 = 0.5; % cart mass [kg]
m2 = 0.5; % pendulum mass [kg]
L = 1.5; % pendulum length [m]
g = -9.1; % gravity
b = 1; % damping from air resistance, and bearing friction
u = 0; % input force (u=0 for no force)

%% ------------ SIMULATION w/ NO CONTROL ------------ %
tspan = 0:.05:10; % simulation timespan 
x0 = [0; 0; pi; 0.01]; % Initial Conditions. x=0 , xdot=0, theta=pi (up), thetadot=0.5 rad/sec
[t,x] = ode45(@(t,y)pendcart(y,m2,m1,L,g,b,u),tspan,x0);

for k=1:length(t)
    drawpend(x(k,:),m2,m1,L);
end
