function plotMeasurements(env,log,veh,it)
% Function that plots the global plan in the environment

wheelBase           = veh.geometry.wheelBase;
vehicleState        = log.states{it};
vehicleVelocity     = log.velocities{it};
measurements        = log.localPlanners{it}.obstacleData;
measurementsWorld   = toWorldFrame(vehicleState(1:2),vehicleState(3),measurements');

arc = 0:0.1:2*pi;

figure;
hold all;
drawMeasurements(measurementsWorld');
drawVeh(vehicleState,vehicleState(3),wheelBase,arc,vehicleVelocity);
drawEnv(env.obst,arc);
axis equal;