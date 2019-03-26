%
function [C, idx, SSE] = my_KMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

  %% If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  %% TO-DO STILL NEED TO CALCULATE SSE
  [N dim] = size(X);
  D = zeros(k, N); %distances between cluster centres and obsevations
  C = initialCentres;
  
 %XX is each row of X multiplied by transpose of the row
 %same for YY
 for i = 1:size(X,1)
     row = X(i,:);
     XX(i) = row*row';
 end
 XX = (XX');
 for j = 1:size(initialCentres,1)
     yrow = initialCentres(j,:);
     YY(i) = yrow*yrow';
 end
 YY = (YY');
 N = size(X,1);
 M = size(initialCentres,1);
 repeatedXX = repmat(XX,1,M);
 repeatedYY = repmat(YY,1,N);
 for i =1:maxIter
      %for c = 1:k
        %  D(c,:) = MySqDist(X, C(c,:));
        %end
      %Y is the initial centres
      
    %D(c,:) = sqrt( bsxfun(@plus,sum(X.^2,2),sum(v.^2,2)') - 2*(X*initialCentres') );
    %D = sqrt( bsxfun(@plus,sum(XX.^2,2),sum(YY.^2,2)') - 2*(XX*YY') );
    D= repeatedXX - (2 * X * initialCentres') + repeatedYY';
       %min gives minimum of each column
       %ds is the minimum distance of each column
       %idx is the row in which it appears
      [Ds, idx] = min(D); % find min dist. for each observation
      SSE = sum(Ds);
      for c = 1:k
          if( sum(idx==c) == 0 )
            warn('k-means: cluster %d is empty', c);
          else
            C(c, :) = myMean( X(idx==c,:) );
          end
      end
   end
end
