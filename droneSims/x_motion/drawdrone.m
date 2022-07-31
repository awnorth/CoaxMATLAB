function x_sim(state)
x = state(1);
x_dot = state(2);

dronex = x;
droney = 0;

plot([-10 10],[0 0]), hold on
rectangle('Position',[dronex-.2 droney-.2 0.4 0.4]); % Plot mass
% rectangle('Position',[pendx-mr/2,pendy-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 0.1 .1],'LineWidth',1.5);
plot([0 dronex],[0 droney],'LineWidth',2,'Color','k'); % Plots the string


axis([-4 4 -3 0.5]);, axis equal
set(gcf,'Position',[100 100 1000 400])
drawnow, hold off