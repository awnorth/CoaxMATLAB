function animateHoleTable(thetaRad,r)

Xloc = r.*cos(thetaRad);
Yloc = r.*sin(thetaRad);

plot([-10,10],[0,0]), hold on
rectangle('Position',[Xloc,Yloc,0.5,0.5],'Curvature',[1,1])

axis([-5 5 -5 5]);, axis equal
set(gcf,'Position',[100 100 1000 400])
pause(0.1);
drawnow, hold off
end


% function drawpend(state,m,M,L)
% x = state(1);
% th = state(3);
% 
% W = 1*sqrt(M/5);  % cart width
% H = .5*sqrt(M/5); % cart height
% wr = .2;          % wheel radius
% mr = .3*sqrt(m);  % mass radius
% 
% y = wr/2+H/2; % cart vertical position
% pendx = x + L*sin(th);
% pendy = y - L*cos(th);
% 
% plot([-10 10],[0 0],'k','LineWidth',2), hold on
% rectangle('Position',[x,0,W,H]);
% rectangle('Position',[pendx-mr/2,pendy-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 0.1 .1],'LineWidth',1.5);
% 
% axis([-5 5 -2 2.5]);, axis equal
% set(gcf,'Position',[100 100 1000 400])
% drawnow, hold off
% end