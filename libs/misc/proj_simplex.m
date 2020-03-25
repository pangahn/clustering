%*************************************************************************
% filename: proj_simplex
%************************************************************************
%%
% To compute the projection of vector z onto the simplex, i.e., 
%  
%   x^* = argmin 0.5||x - z||^2 s.t. x>=0, <e,x>=1
% 
%  By a simple computation, x^* = max(z-theta,0) where theta is given in line 48
%%

function projz = proj_simplex(z,alfa)

if alfa<0; error(['The constant %3.2f must be nonnegative',alfa]); end 
    
n = length(z);

if issorted(z)                        % if z is sorted in ascend order
    
    zs = z(end:-1:1);                
     
elseif issorted(z(end:-1:1)) 
    
    zs = z;                           % z is sorted in descend order

else
    
    zs = sort(z,'descend');          % sort the vector z in the descend order
    
end

k = 1;

while (zs(k)-(sum(zs(1:k))-alfa)/k>0) && (k<=n-1)
        
      k = k +1;
 
end
          
if zs(k)-(sum(zs(1:k))-alfa)/k>0
            
    kmax = k;

else
    
    kmax = k-1;

end    
          
theta = (sum(zs(1:kmax))-alfa)/kmax;
    
projz = max(z - theta,0);

