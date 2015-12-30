% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Code for 1 entire housing simulation

% parameters: sizelimit - blocking group size limit
% output: average - average friend distance for simulation
%         distance_vector - vector of all friend distances for each node

function [average,distance_vector] = simulations(sizelimit)
dist = distances(WattsStrogatz(85,4,0.01));
dist_agree_vector = squareform(dist);
dist_agree_clustering_a = linkage(dist_agree_vector,'average');
clusters = cluster(dist_agree_clustering_a,'cutoff',2,'criterion','distance');

blocking_groups = create_blocking_groups2(clusters,sizelimit);
neighborhoods = sort_neighborhoods([30 30 30 30],blocking_groups);
[average, distance_vector] = friend_distance2(dist,neighborhoods,clusters);
end