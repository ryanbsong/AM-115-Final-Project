% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Return size of clusters

% Parameter: vector - 1D array with list of cluster assignments for each node
% Output: size_vector - 1D array with list of sizes for each cluster

function size_vector = ClusterSize(vector)
% find number of uniqe clusters
num_clusters = numel(unique(vector));
size_vector = zeros(num_clusters,1);
for x = 1:num_clusters
    % find number of elements in each cluster
    size_vector(x) = sum(vector==x);
end
end