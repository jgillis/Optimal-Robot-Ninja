function plotSolverTimes(log1,log2,log3,log4)

times1 = [];
times2 = [];
times3 = [];
times4 = [];

for k = 1:size(log1.log.localPlanners,2)
    times1(end+1) = log1.log.localPlanners{k}.sol.stats.t_wall_solver;
end
for k = 1:size(log2.log.localPlanners,2)
    times2(end+1) = log2.log.localPlanners{k}.sol.stats.t_wall_solver;
end
for k = 1:size(log3.log.localPlanners,2)
    times3(end+1) = log3.log.localPlanners{k}.sol.stats.t_wall_solver;
end
for k = 1:size(log4.log.localPlanners,2)
    times4(end+1) = log4.log.localPlanners{k}.sol.stats.t_wall_solver;
end

figure;
hold all;
plot(times1, '.-');
plot(times2, '.-');
plot(times3, '.-');
plot(times4, '.-');
legend('IP','SQP_{1}','SQP_{2}','SQP_{\infty}');
xlabel('k'); ylabel('solver time [s]');
set(gca,'yscale','log')
end