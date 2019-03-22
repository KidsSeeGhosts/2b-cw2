%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
% Ks = [1,2,3,4,5,7,10,15,20]


for i = 1:length(Ks) % for each k in ks
    k = Ks(i); %get the current k
    disp(k);
    initialCentres = zeros(k,size(X,2));
    for i = 1:k
        currentSample = X(i,:);
        initialCentres(i,:) = currentSample;
    end
    [C, idx, SSE] = my_KMeansClustering(X, k, initialCentres);
    CBaseName='task1_5_c_';
    idxBaseName='task1_5_idx_';
    SSEBaseName='task1_5_sse_';
    CFileName=[CBaseName,num2str(k),'.mat'];
    idxFileName=[idxBaseName,num2str(k),'.mat'];
    sseFileName=[SSEBaseName,num2str(k),'.mat'];
    save(CFileName, 'C');
    save(idxFileName, 'idx');
    save(sseFileName, 'SSE');
end
    
end
