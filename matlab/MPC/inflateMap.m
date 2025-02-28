function MPC = inflateMap(MPC)

values  = MPC.map.values;
N       = (MPC.map.Nw-1)/2;
h       = (MPC.map.width)/2;
sig     = MPC.map.sigma;

% make the gaussian
% on a grid extending 4 standard deviations in each direction
% factor f converts stand dev from cartesian to grid coords
f  = (2*N+1)/(2*h);
nx = ceil(4*f*sig);
ny = ceil(4*f*sig);
g  = makeGaussian(f*sig,f*sig,nx,ny);

% initialize map storing G-landscape values
% (add border to always be able to add the gaussian)
gmap = zeros(size(values,1)+2*nx,size(values,2)+2*ny);

% add gaussian to the map
for i=1:size(values,1)
    for j=1:size(values,2)
        gmap(i:i+2*nx,j:j+2*ny) = gmap(i:i+2*nx,j:j+2*ny) + values(i,j)*g;
    end
end

% remove border added above
MPC.map.inflated = gmap(nx+1:(end-nx),ny+1:(end-ny));


end