function localPlanner = makeLocalPlanner()

localPlanner.obstacleData            = [];            % Measurement data in cartesian coordinates
localPlanner.linearEndSwitchDistance = 0.06;          % Distance to goal from which to switch initial guess type (if this functionality is active)

localPlanner.params.start         = [];     % Starting state
localPlanner.params.goal          = [];     % Goal state
localPlanner.params.startVelocity = [];     % Goal state
localPlanner.params.horizon       = 100;    % Problem horizon
localPlanner.params.dynLimits.vel = [];     % Velocity limits
localPlanner.params.dynLimits.acc = [];     % Acceleration limits
localPlanner.params.dynLimits.jerk = [];    % Jerk limits
localPlanner.params.dynLimits.om  = [];     % Angular velocity limits
localPlanner.params.maxDist       = 0;      % Max distance bewteen two solution states
localPlanner.params.maxDistBeta   = 3;      % Used in calculation of above max dist
localPlanner.params.xglobalx      = [];     % Global plan x-values
localPlanner.params.xglobaly      = [];     % Global plan y-values
localPlanner.params.radii         = [];     % Obstacle radii-values
localPlanner.params.maxR          = 2;    % Max obstacle radius value (max 'bubble size')
localPlanner.params.globalPlanR   = 2;      % Following radius for global plan

localPlanner.usePreloaded                    = false;
localPlanner.withLinearEndInitial            = true;
localPlanner.warmStart                       = true;     % Indicate wether to warm-start iteration or not
localPlanner.rebuildSolver                   = true;     % Indicate wether to rebuild (true) or load (false) the problem
localPlanner.withMaxDistConstraints          = true;
localPlanner.withVelocityConstraints         = true;
localPlanner.withPositiveVelocityConstraints = true;
localPlanner.withOmegaConstraints            = true;
localPlanner.withAccelerationConstraints     = true;
localPlanner.withJerkConstraints             = true;
localPlanner.goalInView                      = false;    % Indicate if final goal is within view or not

localPlanner.init.x        = [];
localPlanner.init.u        = [];
localPlanner.init.T        = 0;
localPlanner.init.s        = [];

localPlanner.sol.x         = [];
localPlanner.sol.u         = [];
localPlanner.sol.T         = 0;
localPlanner.sol.s         = [];
localPlanner.sol.stats     = 0;
localPlanner.sol.success   = false;

localPlanner.solver.type            = 'ipopt';
localPlanner.solver.problemIpoptA   = 0;    
localPlanner.solver.problemIpoptB   = 0;
localPlanner.solver.problemSqpA     = 0;
localPlanner.solver.problemSqpB     = 0;