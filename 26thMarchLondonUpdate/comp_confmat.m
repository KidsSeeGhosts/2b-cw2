function [CM, acc] = comp_confmat(Ytrues, Ypreds, k)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
%g1 = [3 2 2 3 1 1]';	% Known groups
%g2 = [4 2 3 NaN 1 1]';	% Predicted groups
classList = unique([Ytrues;rmmissing(Ypreds)]);
numberOfClasses=length(classList);
CM = zeros(k);
for i = 1:numberOfClasses %for each row
    for j=1:numberOfClasses %for each column
          val=(Ytrues==classList(i)) & (Ypreds==classList(j));
          CM(i,j)=sum(val);
    end
end
acc=sum(diag(CM))/sum(sum(CM));

end
