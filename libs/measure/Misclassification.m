function Missrate = Misclassification(groups,s)
%--------------------------------------------------------------------------
% This function takes the groups resulted from spectral clutsering and the
% ground truth to compute the misclassification rate.
% groups: [grp1,grp2,grp3] for three different forms of Spectral Clustering
% s: ground truth vector
% Missrate: 3x1 vector with misclassification rates of three forms of
% spectral clustering
%--------------------------------------------------------------------------
% Copyright @ Ehsan Elhamifar, 2012
%--------------------------------------------------------------------------
n = max(s);
for i = 1:size(groups,2)
    Missrate(i,1) = missclassGroups( groups(:,i),s,n ) ./ length(s); 
end
end
    
function [miss,index] = missclassGroups(Segmentation,RefSegmentation,ngroups)
%--------------------------------------------------------------------------
% [miss,index] = missclass(Segmentation,RefSegmentation,ngroups)
% Computes the number of missclassified points in the vector Segmentation. 
% Segmentation: 1 by sum(npoints) or sum(ngroups) by 1 vector containing 
% the label for each group, ranging from 1 to n
% npoints: 1 by ngroups or ngroups by 1 vector containing the number of 
% points in each group.
% ngroups: number of groups
%--------------------------------------------------------------------------
% Copyright @ Ehsan Elhamifar, 2012
%--------------------------------------------------------------------------
Permutations = perms(1:ngroups);
if(size(Segmentation,2)==1)
    Segmentation=Segmentation';
end
miss = zeros(size(Permutations,1),size(Segmentation,1));
for k=1:size(Segmentation,1)
    for j=1:size(Permutations,1)
        miss(j,k) = sum(Segmentation(k,:)~=Permutations(j,RefSegmentation));
    end
end

[miss,temp] = min(miss,[],1);
index = Permutations(temp,:);
end