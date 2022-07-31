function pend(state,m,L)
theta = state(1);
theta_dot = state(2);

plot([-10 10],[0 0]), hold on

axis([-5 5 -2 2.5]);, axis equal
set(gcf,'Position',[100 100 1000 400])
drawnow, hold off