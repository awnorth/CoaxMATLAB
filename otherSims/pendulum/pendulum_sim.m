clc;clear
% [t,x] = ode45(@diffeqn,[0 25],[1 0]);
% 
% % plot(t,x(:,1))
% plot(t,x)

m = 1;
L = 2;
a = 0.1; % Air resistance
timespan = [0:0.04:5];
[t,theta] = ode45(@diffeqn,timespan,[pi/2 0]);
plot(t,theta(:,1))

for k = 1:length(t)
    pend(theta(k,:),m,L)
end
