% Example 5.10 from Schaub Junkins
% Simuilation by Andrew North 7/26/22

c = 0.1; % m/2
r0 = 5; % m
thetaDot0 = 1; % rad/s = 10 degree/s

tSpan = [0 48];
theta0 = 0;
[t, thetaRad] = ode45(@(t,theta)holeTableODE(t,theta,c,r0,thetaDot0),tSpan,theta0);
thetaDeg = thetaRad*180/pi;
r = r0-c*t; % current radius

% plot(t,thetaDeg)
% xlabel('time (s)')
% ylabel('theta (deg)')

for i = 1:length(t)
    animateHoleTable(thetaRad(i,:),r(i,:))
end