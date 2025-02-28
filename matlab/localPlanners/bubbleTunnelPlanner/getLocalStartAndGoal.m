function [globalPlanner,localPlanner] = getLocalStartAndGoal(MPC,globalPlanner,localPlanner)

x           = MPC.currentState;
globalStart = MPC.globalStart;
globalGoal  = MPC.globalGoal;
plan        = globalPlanner.worldCoordinates;
last_index  = globalPlanner.lastIndex;
R           = localPlanner.params.globalPlanR;

% Iterate over global plan and get last point on plan
% if no point of plan is further than global plan horizon, get last one in
% the list
% also keep index of last found local goal; the starting value of i and the
% fact that i cannot decrease guarantees that the local goal will never
% 'regress' along the global path.
% THIS METHOD ONLY WORKS AS LONG AS THE GLOBAL PATH STAYS WITHIN THE
% VEHICLE VIEW RADIUS!!

current_index = last_index;
found = 0;
goalInView = false;
i = last_index;
while found==0
    if i==size(plan,1)
        % if no goal found in the entire plan, assume the global goal is
        % within view and set the last plan element as local goal
        found = 1;
        current_index = size(plan,1);
        goalInView = true;
    end
    % find the first point beyond range
    if norm(x(1:2)-plan(i,:)')>R
        found = 1;
        current_index = i;
    end
    i = i+1;
end

g = plan(current_index,:);

% get the local goal orientation
% estimate this orientation by taking the angle of the line connecting the
% point before and after the point on the plan
% exceptions:
% if the local goal is the first plan point: in this case the orientation
% is the orientation of the global Start
% if the local goal is the last plan point: in this case the orientation is
% the orientation of the global Goal
if current_index == 1
    ori = globalStart(3);
elseif current_index == size(plan,1)
    ori = globalGoal(3);
else
    prevP = plan(current_index-1,:);
    nextP = plan(current_index+1,:);
    angle = atan2((nextP(2)-prevP(2)),(nextP(1)-prevP(1)));
    ori   = - (pi/2 - angle); % because of different definition of robot angle
end

g = [g';ori];

% transform goal position from global coordinates to local robot
% coordinates
G = toLocalFrame(x(1:2),x(3),g);

globalPlanner.lastIndex     = current_index;
localPlanner.params.start   = [0;0;0]; % For now, robot always at center of local frame so start is always zero:
localPlanner.params.goal    = G;
localPlanner.goalInView     = goalInView;

end