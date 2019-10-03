function localPlanner = prepareObstacleData(MPC,localPlanner)
    
    % get the measurements
    if localPlanner.usePreloaded
        localCartesian = MPC.obstacleData.preloadedLocal;
    else
        localCartesian  = MPC.obstacleData.meas.localCartesian;
    end
    localGridDx = localPlanner.localGridDx;

    % Process measurements
    localCartesianGrid = processMeas(localCartesian,localGridDx);
    MPC.nav.obstacleData.meas.localCartesianGrid = localCartesianGrid;
    
    % Fill info in variable used by optimization routine
    if localPlanner.withLocalGrid
        localPlanner.obstacleData = localCartesianGrid;
    else
        %localPlanner.obstacleData = localCartesian;
        localPlanner.obstacleData = MPC.obstacleData.preloadedLocal;
    end
end