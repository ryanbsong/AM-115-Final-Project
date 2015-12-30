% AM 115 Final Project
% Ryan Song
% Modified: 12/20/2015
% Description: Code for many housing simulations for different blocking
% limits. Creates plot of results of mean distances with error bars

function run_simulations()
avg_distances = zeros(20,1);
std_dev = zeros(20,1);
for x = 1:20
    runs = zeros(30,1);
    for y = 1:40
        [average, ~] = simulations(2*x);
        runs(y) = average;
    end
    avg_distances(x) = mean(runs);
    std_dev(x) = std(runs)/2;
end
errorbar(2:2:40,avg_distances,std_dev)
title('Average Friend Distance - Metric 2');
end