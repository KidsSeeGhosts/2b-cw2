%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
   %myDir = '/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1724559';
   %[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(myDir);
   %Xtrn = double(Xtrn)/255.0;
   %Xtst = double(Xtst)/255.0;
   
  montageBaseName = 'task1_1_imgs_class';
  images = zeros(28,28,10);
  for i = 0:9 %first ten classes
      for j = 1:10 %first ten images for a class
        %find i in Y
        rowNumbersY = find(Y(:,1)==i);
        currentRow = rowNumbersY(j);
        images(:,:,j) = (reshape(X(currentRow,:), 28, 28)');
      end
      montageFileName = [montageBaseName,num2str(i+1),'.pdf'];
      saveas(montage(images,'Thumbnailsize',[112 112]),montageFileName);    
  end
end