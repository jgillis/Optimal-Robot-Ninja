times4 = [];
for k = 1:size(log.localPlanners,2)
    times4(end+1) = log.localPlanners{k}.sol.stats.t_wall_solver;
end


log = getSolutionGValues(log);
Gvalues4 = [];
for k = 1:size(log.localPlanners,2)
    Gvalues4(end+1) = max(log.localPlanners{k}.post.GValuesGrid);
end