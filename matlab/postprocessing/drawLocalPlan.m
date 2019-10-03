function drawLocalPlan(plan,r)
% Function that draws the local plan in world coordinate frame.

plot(plan(1,:),plan(2,:),'k-','Linewidth',1.5);
plot(plan(1,:)+r*cos(plan(3,:)),plan(2,:)+r*sin(plan(3,:)),'k--','Linewidth',1.5);
plot(plan(1,:)-r*cos(plan(3,:)),plan(2,:)-r*sin(plan(3,:)),'k--','Linewidth',1.5);