function makeEnv()
% Function that makes different environments for the robot to drive around
% in. 
% The environments are made out of geometric shapes.
% They are stored in .dat files for later access.

env.obst            = {};
env.measured        = {};
env.mapped          = {};

%% Environment 1: Two circles

% reset env.obst cell array:
env.obst      = {};

C1  = makeCircle('C1','known',[-4;4;1],3);
C2  = makeCircle('C2','known',[4;4;1],3);

env.obst{end+1} = C1;
env.obst{end+1} = C2;

save data/env1.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env1.fig');
close(gcf);


%% Environment 2: Gap between two long narrow rectangles

% reset env.obst cell array:
env.obst      = {};

R1 = makeRectangle('R1','known',[-2;3;1],3,0.8,-pi/8);
R2 = makeRectangle('R2','known',[2;3;1],3,0.8,pi/8);

env.obst{end+1} = R1;
env.obst{end+1} = R2;

save data/env2.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env2.fig');
close(gcf);


%% Environment 3: two vertical rows of circles

% reset env.obst cell array:
env.obst      = {};

C1  = makeCircle('C1','known',[-2;0;1],1);
C2  = makeCircle('C2','known',[-2;2;1],1);
C3  = makeCircle('C3','known',[-2;4;1],1);
C4  = makeCircle('C4','known',[-2;6;1],1);
C5  = makeCircle('C5','known',[-2;8;1],1);
C6  = makeCircle('C6','known',[2;0;1],1);
C7  = makeCircle('C7','known',[2;2;1],1);
C8  = makeCircle('C8','known',[2;4;1],1);
C9  = makeCircle('C9','known',[2;6;1],1);
C10 = makeCircle('C10','known',[2;8;1],1);

env.obst{end+1} = C1;
env.obst{end+1} = C2;
env.obst{end+1} = C3;
env.obst{end+1} = C4;
env.obst{end+1} = C5;
env.obst{end+1} = C6;
env.obst{end+1} = C7;
env.obst{end+1} = C8;
env.obst{end+1} = C9;
env.obst{end+1} = C10;

save data/env3.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env3.fig');
close(gcf);


%% Environment 4: arbitrarily placed circles and rectangles

% reset env.obst cell array:
env.obst      = {};

C1 = makeCircle('C1','known',[2;2;1],1);
C2 = makeCircle('C2','known',[5;7;1],2);
C3 = makeCircle('C3','known',[9;3;1],1);
C4 = makeCircle('C4','known',[9;6;1],1);
R1 = makeRectangle('R1','known',[4.5;2;1],1,1,pi/12);

env.obst{end+1} = C1;
env.obst{end+1} = C2;
env.obst{end+1} = C3;
env.obst{end+1} = C4;
env.obst{end+1} = R1;
              
save data/env4.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env4.fig');
close(gcf);


%% Environment 5: corridor formed by by two long rectangles

% reset env.obst cell array:
env.obst      = {};
              
R1 = makeRectangle('R1','known',[-3;5;1],1,5,0);
R2 = makeRectangle('R2','known',[3;5;1],1,5,0);

env.obst{end+1} = R1;
env.obst{end+1} = R2;

save data/env5.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env5.fig');
close(gcf);


%% Environment 6: Same as environment 5 but with a small circular obstacle at side of the corridor 

% reset env.obst cell array:
env.obst      = {};
              
R1 = makeRectangle('R1','known',[-3;5;1],1,5,0);
R2 = makeRectangle('R2','known',[3;5;1],1,5,0);
C1 = makeCircle('C1','unknown',[1;6;1],0.7);

env.obst{end+1} = R1;
env.obst{end+1} = R2;
env.obst{end+1} = C1;

save data/env6.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env6.fig');
close(gcf);


%% Environment 7: Same as environment 5 but with a small circular obstacle in center of the corridor 
                       
% reset env.obst cell array:
env.obst      = {};
              
R1 = makeRectangle('R1','known',[-3;5;1],1,5,0);
R2 = makeRectangle('R2','known',[3;5;1],1,5,0);
C1 = makeCircle('C1','unknown',[0;6;1],0.7);

env.obst{end+1} = R1;
env.obst{end+1} = R2;
env.obst{end+1} = C1;

save data/env7.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env7.fig');
close(gcf);


%% Environment 8: Empty

% reset env.obst cell array:
env.obst      = {};

save data/env8.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env8.fig');
close(gcf);


%% Environment 9: Slalom of medium-sized circles

% reset env.obst cell array:
env.obst      = {};

C1  = makeCircle('C1','known',[-1.2;0;1],1);
C2  = makeCircle('C2','known',[1.2;2;1],1);
C3  = makeCircle('C3','known',[-1.2;4;1],1);
C4  = makeCircle('C4','known',[1.2;6;1],1);
C5  = makeCircle('C5','known',[-1.2;8;1],1);

env.obst{end+1} = C1;
env.obst{end+1} = C2;
env.obst{end+1} = C3;
env.obst{end+1} = C4;
env.obst{end+1} = C5;

save data/env9.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env9.fig');
close(gcf);

%% Environment 10: One circle

% reset env.obst cell array:
env.obst      = {};

C1  = makeCircle('C1','known',[4;4;1],3);

env.obst{end+1} = C1;

save data/env10.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env10.fig');
close(gcf);

%% Environment 11: one rectangle

% reset env.obst cell array:
env.obst      = {};
              
R1 = makeRectangle('R1','known',[0;0;1],4,4,0);

env.obst{end+1} = R1;

save data/env11.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env11.fig');
close(gcf);


%% Environment 12: Matrix of medium-sized known circles

% reset env.obst cell array:
env.obst      = {};

nrows       = 5;
ncolumns    = 5;
horspacing  = 3;
verspacing  = 3;
Rcircle     = 1;

for i=1:nrows
    for j=1:ncolumns
        name = ['C',num2str((i-1)*ncolumns+j)];
        if rem(i,2)==0
            centerx = (j-1)*horspacing;
        else
            centerx = (j-1)*horspacing + 0.5*horspacing;
        end
        centery = (i-1)*verspacing;
        C = makeCircle(name,'known',[centerx;centery;1],Rcircle);
        env.obst{end+1} = C;
    end
end


% C1  = makeCircle('C1','known',[-3;0;1],1);
% 
% 
% C2  = makeCircle('C2','known',[1.2;2;1],1);
% C3  = makeCircle('C3','known',[-1.2;4;1],1);
% C4  = makeCircle('C4','known',[1.2;6;1],1);
% C5  = makeCircle('C5','known',[-1.2;8;1],1);
% 
% env.obst{end+1} = C1;
% env.obst{end+1} = C2;
% env.obst{end+1} = C3;
% env.obst{end+1} = C4;
% env.obst{end+1} = C5;

save data/env12.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env12.fig');
close(gcf);



%% Environment 13: Matrix of closely packed medium-sized known circles

% reset env.obst cell array:
env.obst      = {};

nrows       = 5;
ncolumns    = 5;
horspacing  = 2.5;
verspacing  = 2.5;
Rcircle     = 1;

for i=1:nrows
    for j=1:ncolumns
        name = ['C',num2str((i-1)*ncolumns+j)];
        if rem(i,2)==0
            centerx = (j-1)*horspacing;
        else
            centerx = (j-1)*horspacing + 0.5*horspacing;
        end
        centery = (i-1)*verspacing;
        C = makeCircle(name,'known',[centerx;centery;1],Rcircle);
        env.obst{end+1} = C;
    end
end


save data/env13.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env13.fig');
close(gcf);



%% Environment 14: Office environment 
                       
% reset env.obst cell array:
env.obst      = {};
              
R1  = makeRectangle('R1','known',[0.9;1.15;1],5.4,0.3,0);
R2  = makeRectangle('R2','known',[-1.65;-0.5;1],0.3,3,0);
R3  = makeRectangle('R3','known',[1.65;0.425;1],0.3,1.15,0);
R4  = makeRectangle('R4','known',[1.65;-1.425;1],0.3,1.15,0);
R5  = makeRectangle('R5','known',[3.45;-1.5;1],0.3,5,0);
R6  = makeRectangle('R6','known',[0;-2.15;1],3.6,0.3,0);
R7  = makeRectangle('R7','known',[1.65;-4.225;1],0.3,3.85,0);
R8  = makeRectangle('R8','known',[5.25;-2.7;1],3.3,0.3,0);
R9  = makeRectangle('R9','known',[6.75;-4.35;1],0.3,3,0);
R10 = makeRectangle('R10','known',[3.45;-5.275;1],0.3,1.15,0);
R11 = makeRectangle('R11','known',[4.2;-6;1],5.4,0.3,0);

env.obst{end+1} = R1;
env.obst{end+1} = R2;
env.obst{end+1} = R3;
env.obst{end+1} = R4;
env.obst{end+1} = R5;
env.obst{end+1} = R6;
env.obst{end+1} = R7;
env.obst{end+1} = R8;
env.obst{end+1} = R9;
env.obst{end+1} = R10;
env.obst{end+1} = R11;

save data/env14.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env14.fig');
close(gcf);



%% Environment 15: Convex obstacle
                       
% reset env.obst cell array:
env.obst      = {};

nSides = 6;
radius = 3;

phi = 2*pi/nSides;

a = 2*radius*sin(phi/2);
b = sqrt(radius^2 - (a^2)/4);

for i=1:(nSides/2)
    R  = makeRectangle('R','known',[0;0;1],2*b,a,(i-1)*phi);
    env.obst{end+1} = R;
end

save data/env15.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env15.fig');
close(gcf);



%% Environment 16: Matrix of medium-sized known squares

% reset env.obst cell array:
env.obst      = {};

nrows       = 3;
ncolumns    = 3;
horspacing  = 3;
verspacing  = 3;
Height      = 1.7;
Width       = 1.7;

for i=1:nrows
    for j=1:ncolumns
        name = ['R',num2str((i-1)*ncolumns+j)];
        if rem(i,2)==0
            centerx = (j-1)*horspacing;
        else
            centerx = (j-1)*horspacing + 0.5*horspacing;
        end
        centery = (i-1)*verspacing;
        C = makeRectangle(name,'known',[centerx;centery;1],Width,Height,0);
        env.obst{end+1} = C;
    end
end

save data/env16.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env16.fig');
close(gcf);


%% Environment 17: For report

% reset env.obst cell array:
env.obst      = {};

C1 = makeCircle('C1','known',[5;3;1],1);
C2 = makeCircle('C2','known',[3;3;1],2);
R1 = makeRectangle('R1','known',[9;3;1],4,1,0);
R2 = makeRectangle('R2','known',[9;1.5],4,1,-pi/3);

env.obst{end+1} = C1;
env.obst{end+1} = C2;
env.obst{end+1} = R1;
env.obst{end+1} = R2;
              
save data/env17.mat env

plotEnv(env);
savefig(gcf,'figs/envFigs/env17.fig');
close(gcf);



end