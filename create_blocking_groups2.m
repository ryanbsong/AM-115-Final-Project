% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Create blocking groups using method 2

% parameters: clusters - 1D vector with cluster assignment for each node
%             limit - blocking group size limit
% output: blocking_groups - 1D vector with blocking group assignment for
% each node

% creates blocking groups
function blocking_groups = create_blocking_groups2(clusters,limit)
num_clusters = numel(unique(clusters));
blocking_groups = zeros(size(clusters));
group_num = 1;
for x = 1:num_clusters
    indices = find(clusters==x);
    splits = split_cluster(limit,length(indices));
    for y = 1:length(splits)
        size_vector = splits(y);
        block = datasample(indices,size_vector,'Replace',false);
        indices = setxor(indices,block);
        for z = 1:length(block)
            i = block(z);
            blocking_groups(i) = group_num;
        end
        group_num = group_num + 1;
    end
end

% function for splitting up a cluster evenly if it exceeds the blocking
% size limit
function groupsizevector = split_cluster(limit,cluster_size)
num_groups = ceil(cluster_size/limit);
groupsizevector = zeros(num_groups,1);
k = floor(cluster_size/num_groups);
num_k_plus_one_groups = mod(cluster_size,num_groups);
for x = 1:num_k_plus_one_groups
    groupsizevector(x) = k+1;
end
for x = (num_k_plus_one_groups+1):num_groups
    groupsizevector(x) = k;
end