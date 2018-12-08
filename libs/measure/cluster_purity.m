function purity = cluster_purity(clusters, classes)
%CLUSTER_PURITY calculate the purity of cluster result
%  INPUT:
%      clusters: output of algorithm
%      classes: the true label
%  OUTPUT:
%       purity: result of evaluation

clusters = reshape(clusters,[],1);
classes = reshape(classes,[],1);

% Label matching
N = length(classes); % length of class
label_in2 = zeros(N,1);
label_in_unique = unique(classes); % class label
num_label_in = length(label_in_unique); % number of class
for i = 1:num_label_in
    idx = classes == label_in_unique(i);
    label_in2(idx) = mode(clusters(idx)); % value repeates most often in cluster
end

% calculate purity
purity = sum(clusters==label_in2)/N;

end