% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Conduct hierarchical clustering and create dendrogram

% create distance matrix between all nodes in a Watts-Strogatz Network
dist = distances(WattsStrogatz(50,4,0.01));
dist_agree_vector = squareform(dist);

% clustering based on average metric
dist_agree_clustering = linkage(dist_agree_vector,'average');

% create dendrogram of network
figure(3)
h3 = dendrogram(dist_agree_clustering_a,0);
refline(0,2);
set(h3,'LineWidth',2)
set(gca,'FontSize',20,'XTickLabel','')
axis([-inf inf 0 5])

% divide nodes up into clusters with average distance cutoff of 2
clusters = cluster(dist_agree_clustering,'cutoff',2,'criterion','distance');