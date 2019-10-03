function localPlanner = getGlobalPlanPortion(MPC,globalPlanner,localPlanner)
    
    currentState = MPC.currentState;
    plan         = globalPlanner.worldCoordinates;
    
    % get first point on global plan closest to current state and set that
    % as first index of portion of global plan to take into account:
    closest         = 1;
    minDistance     = 10000; %some crazy big number
    for i=1:size(plan,1)
        distance = norm(currentState(1:2)-plan(i,:));
        if distance<minDistance
            closest = i;
            minDistance = distance;
            if closest == size(plan,1)
                closest = i-1;
            end
        end
    end
    
    xglobalx = globalPlanner.worldCoordinates(closest:globalPlanner.lastIndex,1);
    xglobaly = globalPlanner.worldCoordinates(closest:globalPlanner.lastIndex,2);
    
    % transform to local frame before calling solver:
    Xglobal = toLocalFrame(MPC.currentState(1:2),MPC.currentState(3),[xglobalx';xglobaly']);
    
    % replace first element by 0;
    % the first element will typically slightly deviate from 0 due to map
    % discretization; but it is best of the local planner gets a list with
    % exactly zeros as a start, therefore replace first element.
    localPlanner.params.xglobalx = [0;Xglobal(1,2:end)']; 
    localPlanner.params.xglobaly = [0;Xglobal(2,2:end)'];
    
end