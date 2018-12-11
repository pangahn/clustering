% Windows 7 on Intel(R) Core(TM) i7-2600K CPU @ 3.40GHz with 16G memory 
% Matlab R2011b (7.13.0.564) 64-bit (win64) 
% data from http://www.cad.zju.edu.cn/home/dengcai/Data/Clustering.html

% MNIST data set (70000 samples with 784 dimensions) 
clear;
load('Orig.mat'); 

% litekmeans
tic;[label, center] = litekmeans(fea, 200, 'MaxIter', 20);toc
Elapsed time is 11.515731 seconds. 

% kmeans provided in Matlab
tic;[label, center] = kmeans(fea, 200, 'OnlinePhase','off','MaxIter', 20);toc
Elapsed time is 237.617422 seconds.