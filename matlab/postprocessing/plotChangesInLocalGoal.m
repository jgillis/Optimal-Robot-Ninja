function plotChangesInLocalGoal(log,it)

% plot the local goal orientations:
figure;

subplot(2,1,1);
hold all;
for k=1:it
    goal = log.localPlanners{k}.params.goal;
    plot(k,goal(3),'k.','Markersize',10);
end

% plot solving times:
subplot(2,1,2);
hold all;
for k=1:it
    time = log.localPlanners{k}.sol.stats.t_wall_solver;
    plot(k,time,'k.','Markersize',10);
end