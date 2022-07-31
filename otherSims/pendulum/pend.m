function pend(state,m,L)
theta = state(1);
theta_dot = state(2);

pendx = L*sin(theta);
pendy = -L*cos(theta);

plot([-10 10],[0 0]), hold on
rectangle('Position',[pendx-.1 pendy-.1 0.2 0.2], 'Curvature', [1 1]); % Plot mass
% rectangle('Position',[pendx-mr/2,pendy-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 0.1 .1],'LineWidth',1.5);
plot([0 pendx],[0 pendy],'LineWidth',2,'Color','k'); % Plots the string


axis([-4 4 -3 0.5]);, axis equal
set(gcf,'Position',[100 100 1000 400])
drawnow, hold off