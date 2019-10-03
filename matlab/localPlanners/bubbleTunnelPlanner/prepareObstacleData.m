function localPlanner = prepareObstacleData(MPC,localPlanner)
    
if localPlanner.usePreloaded
    localCartesian  = MPC.obstacleData.preloadedLocal;
else
    localCartesian  = MPC.obstacleData.meas.localCartesian;
end
    
localPlanner.obstacleData = localCartesian;
    
end