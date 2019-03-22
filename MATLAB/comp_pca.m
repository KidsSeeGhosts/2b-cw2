function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
  %% TO-DO
    N = length(X);
    x_mean = myMean(X); %calculate mean for each column
    X = bsxfun(@minus, X, x_mean); %mean shift original matrix
    covar_m = 1/(N-1) * (X' * X); % Compute covariance matrix of X
    [EVecs,EVals] = eig(covar_m);
    EVals = diag(EVals);
    %EVals = sort(EVals, 1, 'descend');
    [tmp, ridx] = sort(EVals, 1, 'descend');%new line
    EVals = EVals(ridx); %new line
    EVecs = EVecs(:,ridx); %orders it by evals index
    %eigenvectors are the columns of EVecs
    for i = 1:size(EVecs,2) %no. of columns
        if sign(EVecs(1,i)) == -1 %if first element in eigenvector is negative, multiply the eigenvector by -1
            EVecs(:,i) = EVecs(:,i)*-1;
        end
    end
end

