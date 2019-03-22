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
imageVectorBaseName='imageVector';
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
      imageVectorFileName=[imageVectorBaseName,num2str(i),'.png'];
      saveas(image(reshape(M(i+1,:)*255.0, 28, 28)'), imageVectorFileName);
end
for k = 1:length(X) %getting all images for a class
        currentRow = k;
        colormap 'gray';
        currentVector = X(currentRow,:);
        M(11,:) = (M(11,:)+currentVector);
end
meanVector = M(11,:)/length(X);
M(11,:) = meanVector;
imageVectorFileName=[imageVectorBaseName,num2str(10),'.png'];
saveas(image(reshape(M(11,:)*255.0, 28, 28)'), imageVectorFileName);
meanVectorImages = {'imageVector0.png', 'imageVector1.png', 'imageVector2.png', 'imageVector3.png', 'imageVector4.png', 'imageVector5.png', 'imageVector6.png', 'imageVector7.png', 'imageVector8.png', 'imageVector9.png', 'imageVector10.png'}
montage(meanVectorImages);
saveas(montage(meanVectorImages), 'task1_2_imgs.pdf');
for i = 0:10
    delete([imageVectorBaseName,num2str(i),'.png'])
    end
end
