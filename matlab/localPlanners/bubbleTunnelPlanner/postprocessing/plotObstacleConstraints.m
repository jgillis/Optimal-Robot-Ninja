function plotObstacleConstraints(log,it)

currentState    = log.states{it};
localStart      = log.localPlanners{1}.params.start;
localGoal       = log.localPlanners{1}.params.goal;
xgx             = log.localPlanners{it}.sol.xgx;
xgy             = log.localPlanners{it}.sol.xgy;
r               = log.localPlanners{it}.sol.r;
S               = log.localPlanners{it}.sol.s;

N = 500;
S = interpolateUntil(S,N);

arc = 0:0.05:2*pi;

for k=1:size(S,1)
    
    % plot filled circles
    x_circle        = full(xgx(S(k)))+full(r(S(k)))*cos(arc);
    y_circle        = full(xgy(S(k)))+full(r(S(k)))*sin(arc);
    circleLocal     = [x_circle;y_circle];
    circleGlobal    = toWorldFrame(currentState(1:2),currentState(3),circleLocal);
    fill(circleGlobal(1,:), circleGlobal(2,:),[159 198 167]/255,'LineStyle','none');
    
    % plot tunnel edge
    % get angle
%     if k==1
%         startWorld = toWorldFrame(currentState(1:2),currentState(3),localStart);
%         theta = startWorld(3);
%     elseif k==N
%         goalWorld = toWorldFrame(currentState(1:2),currentState(3),localGoal);
%         theta = goalWorld(3);
%     else
%         theta = atan2(full(xgy(S(k+1)))-full(xgy(S(k-1))),full(xgx(S(k+1)))-full(xgx(S(k-1))));
%     end
%     rightPoint = [full(xgx(S(k)))+full(r(S(k)))*sin(theta);full(xgy(S(k)))-full(r(S(k)))*cos(theta)];
%     RightPoint = toWorldFrame(currentState(1:2),currentState(3),rightPoint);
%     plot(RightPoint(1),RightPoint(2),'.','color',0.5*[159 198 167]/255);
end

end