function plotMPCState(log,veh,env,it,varargin)

if nargin==4
    fprintf('Plotting MPC state %i \n',it);
end

% get data
wheelBase       = veh.geometry.wheelBase;
states          = {log.states{1:it}};
vehicleState    = log.states{it};
vehicleVelocity = log.velocities{it};
localPlan       = log.localPlanners{it}.sol.x;
localGoal       = log.localPlanners{it}.params.goal;
globalStart     = log.globalStart;
globalGoal      = log.globalGoal;
globalPlan      = log.globalPlanners{end}.worldCoordinates;
arc             = 0:0.01:2*pi;
measurements    = log.localPlanners{it}.obstacleData;

% transform solution to global frame
localPlanWorld = toWorldFrame(vehicleState(1:2),vehicleState(3),localPlan);

% transform local goal to global frame
localGoalWorld = toWorldFrame(vehicleState(1:2),vehicleState(3),localGoal);

% transform measurements to global frame
measurementsWorld = toWorldFrame(vehicleState(1:2),vehicleState(3),measurements');

% draw
figure;
hold all;

drawEnv(env.obst,arc);

% call postprocessing plotting method from localPlanner
plotObstacleConstraints(log,it);

% other plots
drawGlobalPlan(globalPlan);
drawStartAndGoal(globalStart,globalGoal);
drawStates(states,veh);
drawVeh(vehicleState,vehicleState(3),wheelBase,arc,vehicleVelocity);
drawLocalPlan(localPlanWorld,wheelBase/2);
drawLocalGoal(localGoalWorld);
drawMeasurements(measurementsWorld');

% title
titlestr = ['MPC state at iteration ',num2str(it)];
%title(titlestr);
axis equal;
axis([-2 15 -2 15]);
set(gca,'visible','off')