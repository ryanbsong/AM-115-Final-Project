% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Calculates Average Friend Distance Metric 1

% parameters: distances - nxn matrix with all distances between all
% possible pairs of nodes
%             sorted - list of neighborhood assignments for blocking group
%             clusters - list of friend cluster assignments for all nodes
% output: mean_distance - average friend distance value
%         distance_vector - 1D vector containing all the distances from
%         every node

function [mean_distance,distance_vector] = friend_distance(distances,sorted,clusters)
num_students = length(clusters);
distance_vector = zeros(num_students,1);
for x = 1:num_students
    distance_sum = 0;
    % neighborhood is the current neighborhood for student x
    neighborhood = sorted(clusters(x));
    num_neighbors = 0;
    for y = 1:num_students
        % only calculate average for immediate neighbors
        if distances(y,x)== 1
            distance_sum = distance_sum + abs(neighborhood - sorted(clusters(y)));
            num_neighbors = num_neighbors + 1;
        end
    end
    distance_vector(x) = distance_sum/num_neighbors;
end
mean_distance = mean(distance_vector);
end