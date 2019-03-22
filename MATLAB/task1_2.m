%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
M = zeros(11,size(X,2));
meanVectors = zeros(28,28,11);
for i = 0:9 %first ten classes
      rowNumbersY = find(Y(:,1)==i);
      for j = 1:length(rowNumbersY) %getting all images for a class
        %find i in Y
        currentRow = rowNumbersY(j);
        colormap 'gray';
        currentVector = X(currentRow,:);
        M(i+1,:) = (M(i+1,:)+currentVector);
      end
      meanVector = M(i+1,:)/length(rowNumbersY);
      M(i+1,:) = meanVector;
      meanVectors(:,:,i+1) = (reshape(M(i+1,:), 28, 28)');
end

for k = 1:length(X) %getting all images for a class
        currentRow = k;
        colormap 'gray';
        currentVector = X(currentRow,:);
        M(11,:) = (M(11,:)+currentVector);
end

meanVector = M(11,:)/length(X);
M(11,:) = meanVector;
meanVectors(:,:,11) = (reshape(M(11,:), 28, 28)');
saveas(montage(meanVectors,'Thumbnailsize',[112 112]), 'task1_2_imgs.pdf');
end
