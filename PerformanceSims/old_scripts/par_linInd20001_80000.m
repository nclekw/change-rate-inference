clear
rng('shuffle')
filename='perfTable.mat';
load(filename)

params = table2array(perfTable(:,1:5));
nSims=10000;

tic
parfor linIdx = 20001:80000
   perfTable(linIdx,6) =...
       array2table(perfGenPrior(params(linIdx,:),nSims));
end
toc

save('perfTable.mat','perfTable','-v7.3')
