% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Sort Blocking Groups into Neighborhoods

% parameters: limits - blocking size limit
%             clusters - 1D vector of blocking assignments for each node
% output: sort_vector - 1D vector with neighborhood assignments for each
% blocking group

function sort_vector = sort_neighborhoods(limits,clusters)
clustersizes = ClusterSize(clusters);
num_clusters = length(clustersizes);
sort_vector = zeros(num_clusters,1);
for x = 1:num_clusters
    % cont variable is so loop continues until housing assignment is
    % completed or fails
    cont = true;
    % it's possible for the random housing assignment to not work. If
    % that's the case, then break from loop. This will only happen if a
    % blocking group cannot be added to any of the four neighborhoods due
    % to the constraint
    vals = [false false false false];
    while cont
        sort = randi([1 4],1,1);
        % called when sorting fails
        if sum(vals)==4
            error('sorting failed');
        else
            if clustersizes(x)<=limits(sort)
                % sorting into the river houses
                if sort ~= 4
                    sort_vector(x) = sort;
                    limits(sort) = limits(sort)-clustersizes(x);
                    cont = false;
                else
                % sorting into the Quad houses (furthest neighborhood)
                    sort_vector(x) = 6;
                    limits(sort) = limits(sort)-clustersizes(x);
                    cont = false;
                end
            else
                vals(sort) = true;
            end
        end
    end
end
end