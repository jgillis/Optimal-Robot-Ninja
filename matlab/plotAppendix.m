function plotAppendix(log1,log2,log3,log4)

% get data
V1          = log1.log.velocities;
V2          = log2.log.velocities;
V3          = log3.log.velocities;
V4          = log4.log.velocities;

velLimits   = log1.log.localPlanners{1}.params.dynLimits.vel;

% % reconstruct dynamic properties
% [A,J,dT] = getAccelerationAndJerk(U,T,horizon);
% 
% % plot velocities and accelerations in wheels:
% t_vec = linspace(0,T(end),horizon+1);

% slack = 0.1;
% [vRightUpper,vRightLower] = getAxisLimits(max(max(U(1,:)),velLimits(2)),min(min(U(1,:)),velLimits(1)),slack);
% [vLeftUpper,vLeftLower]   = getAxisLimits(max(max(U(2,:)),velLimits(2)),min(min(U(2,:)),velLimits(1)),slack);
% [aRightUpper,aRightLower] = getAxisLimits(max(max(A(1,:)),accLimits(2)),min(min(A(1,:)),accLimits(1)),slack);
% [aLeftUpper,aLeftLower]   = getAxisLimits(max(max(A(2,:)),accLimits(2)),min(min(A(2,:)),accLimits(1)),slack);
% [jRightUpper,jRightLower] = getAxisLimits(max(max(J(1,:)),jerkLimits(2)),min(min(J(1,:)),jerkLimits(1)),slack);
% [jLeftUpper,jLeftLower]   = getAxisLimits(max(max(J(2,:)),jerkLimits(2)),min(min(J(2,:)),jerkLimits(1)),slack);

vR1 = [];
vL1 = [];
for k = 1:size(V1,2)
    vR1(end+1) = V1{k}(1);
    vL1(end+1) = V1{k}(2);
end
vR2 = [];
vL2 = [];
for k = 1:size(V2,2)
    vR2(end+1) = V2{k}(1);
    vL2(end+1) = V2{k}(2);
end
vR3 = [];
vL3 = [];
for k = 1:size(V3,2)
    vR3(end+1) = V3{k}(1);
    vL3(end+1) = V3{k}(2);
end
vR4 = [];
vL4 = [];
for k = 1:size(V4,2)
    vR4(end+1) = V4{k}(1);
    vL4(end+1) = V4{k}(2);
end

figure;

subplot(1,2,1);
hold all;
plot(vR1(1,:),'Linewidth',1.5);
plot(vR2(1,:),'Linewidth',1.5);
plot(vR3(1,:),'Linewidth',1.5);
plot(vR4(1,:),'Linewidth',1.5);
plot(ones(1,size(vR1,2))*velLimits(1),'r--');
plot(ones(1,size(vR1,2))*velLimits(2),'r--');
axis([0 1.1*size(vR1,2) 1.1*velLimits(1) 1.1*velLimits(2)]);
xlabel('MPC iteration'); ylabel('v_{R}(t) [m/s]'); title('v_{right}(t)');
legend('IP','SQP_{1}','SQP_{2}','SQP_{\infty}','Location','southeast');

subplot(1,2,2);
hold all;
plot(vL1(1,:),'Linewidth',1.5);
plot(vL2(1,:),'Linewidth',1.5);
plot(vL3(1,:),'Linewidth',1.5);
plot(vL4(1,:),'Linewidth',1.5);
plot(ones(1,size(vL1,2))*velLimits(1),'r--');
plot(ones(1,size(vL1,2))*velLimits(2),'r--');
axis([0 1.1*size(vL1,2) 1.1*velLimits(1) 1.1*velLimits(2)]);
xlabel('MPC iteration'); ylabel('v_{L}(t) [m/s]'); title('v_{left}(t)');
legend('IP','SQP_{1}','SQP_{2}','SQP_{\infty}','Location','southeast');

set(gcf,'Position',[100,100,1000,400]);

