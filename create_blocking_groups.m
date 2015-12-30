% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Create blocking groups using method 1

% parameters: clusters - 1D vector with cluster assignment for each node
%             limit - blocking group size limit
% output: blocking_groups - 1D vector with blocking group assignment for
% each node

function blocking_groups = create_blocking_groups(clusters,limit)
% find number of unique clusters
num_clusters = numel(unique(clusters));
sizes = ClusterSize(clusters);
blocking_groups = zeros(size(clusters));

% number blocking groups from 1 to # of blocking groups
group_num = 1;
for x = 1:num_clusters
    % find all indices of nodes in a specific cluster
    indices = find(clusters==x);
    % if the cluster size is less than limit, add all elements in cluster
    % to one blocking group
    if sizes(x) <= limit
        for y = 1:length(indices)
            i = indices(y);
            blocking_groups(i) = group_num;
        end
        group_num = group_num + 1;
    % if cluster size is greater than limit, keep creating blocking groups
    % of size limit until cluster is empty
    else
        cont = true;
        while cont
            if limit <= length(indices)
                % randomly sample 'limit' number from indices
                block = datasample(indices,limit,'Replace',false);
                % remove the sampled block so there is no double count
                indices = setxor(indices,block);
                for y = 1:length(block)
                    i = block(y);
                    blocking_groups(i) = group_num;
                end
                group_num = group_num + 1;
                % if there are no more elements in the cluster, break out
                % of loop
            elseif isempty(indices)
                cont = false;
            else
                for y = 1:length(indices)
                    i = indices(y);
                    blocking_groups(i) = group_num;
                end
                group_num = group_num + 1;
                cont = false;
            end
        end
    end
end
    