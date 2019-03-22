%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.

%N = length(X);
%x_mean = mean(X, 1); %calculate mean for each column
%X = bsxfun(@minus, X, x_mean); %mean shift original matrix
%covar_m = 1/(N-1) * (X' * X); % Compute covariance matrix of X
[EVecs, EVals] = comp_pca(X); %finding eigenvectors and eigenvalues, eigenvalues are the variances
CumVar = cumsum(EVals);%used to be cumsum(a)
plot(CumVar);
totalVar = CumVar(length(CumVar)); %last element of CumVar
MinDims = [0.7*totalVar;0.8*totalVar;0.9*totalVar;0.95*totalVar]
for i = 1:4
    for j = 1:length(CumVar)
        if CumVar(j) > MinDims(i)
            MinDims(i) = j;
            break;
        end
    end
end
end
