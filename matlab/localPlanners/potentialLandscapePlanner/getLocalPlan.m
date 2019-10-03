function [MPC,globalPlanner,localPlanner] = getLocalPlan(MPC,veh,globalPlanner,localPlanner,log)

    MPC_iteration = MPC.k;
    
    fprintf('Getting local plan \n');
    
    % initialize the local planner
    if MPC_iteration == 1
        fprintf('\t Initializing local planner (first call) \n');
        localPlanner = initializeLocalPlanner(localPlanner,veh,log);
    end
    
    % process and transform obstacle data to local frame and move to MPC 
    % data structure:
    fprintf('\t Preparing obstacle data \n');
    localPlanner = prepareObstacleData(MPC,localPlanner);
    
    % get starting velocity
    localPlanner.params.startVelocity = MPC.currentVelocity;

    % get the local goal on the global plan, and transform it to the
    % local coordinate frame to be used in the optimization problem
    fprintf('\t Getting local start and goal \n');
    [globalPlanner,localPlanner] = getLocalStartAndGoal(MPC,globalPlanner,localPlanner);

    % solve optimization problem
    fprintf('\t Solving problem \n');
    %localPlanner = optim(MPC,localPlanner,globalPlanner,veh,MPC_iteration);
    
    try
        localPlanner.warmStart = true;
        localPlanner.solver.type = 'sqp1';
        localPlanner = optim(MPC,localPlanner,globalPlanner,veh,MPC_iteration);
    catch ME1
        fprintf(2,'********************************************************* \n');
        fprintf(2,'Infeasible detected - trying with different initial guess \n');
        fprintf(2,'********************************************************* \n');
        localPlanner.warmStart = false;
        try
            localPlanner = optim(MPC,localPlanner,globalPlanner,veh,MPC_iteration);
        catch ME2
            fprintf(2,'********************************************************* \n');
            fprintf(2,'Infeasible detected - trying with IPOPT \n');
            fprintf(2,'********************************************************* \n');
            localPlanner.solver.type = 'ipopt';
            localPlanner = optim(MPC,localPlanner,globalPlanner,veh,MPC_iteration);
        end
    end
    
end