function drawStates(states,veh)
% Function that draws the vehicle states in world coordinate frame.

r = veh.geometry.wheelBase/2;

for k=1:size(states,2)
    plot(states{k}(1),states{k}(2),'k.','Markersize',6,'LineWidth',1.5);
    plot(states{k}(1)+r*cos(states{k}(3)),states{k}(2)+r*sin(states{k}(3)),'k.','Linewidth',1.5);
    plot(states{k}(1)-r*cos(states{k}(3)),states{k}(2)-r*sin(states{k}(3)),'k.','Linewidth',1.5);
end