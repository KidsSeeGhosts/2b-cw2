function [Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector (uint8) for Xtrain
%   Xtest  : N-by-D test data matrix (double)
%   Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
% Output:
%   Ypreds : N-by-L matrix (uint8) of predicted labels for Xtest
Ypreds = zeros(length(Xtest),length(Ks));
for i = 1:length(Xtest)
    for j = 1:length(Ks)
        k = Ks(j);
        C = Ytrain;
        r_zx = MySqDist(Xtrain, Xtest(i,:));
        [r_zx,idx] = sort(r_zx, 2, 'ascend');
        r_zx = r_zx(1:k);
        idx = idx(1:k);
        Ypreds(i,j) = mode(C(idx));
    end
end


end
