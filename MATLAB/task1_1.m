%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
   %myDir = '/Users/ruairiohare/Documents/MATLAB/';
   %[Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(myDir);
   %Xtrn = double(Xtrn)/255.0;
   %Xtst = double(Xtst)/255.0;
   
  %for i=1:10
  %  imagegallery{i}=read(facedatabase(i),1);
  %end
  %montage(imagegallery(1).ImageLocation);
  imageBaseName='image';
  montageBaseName = 'task1_1_imgs_class';
  for i = 0:9 %first ten classes
      for j = 1:10 %first ten images for a class
        %find i in Y
        rowNumbersY = find(Y(:,1)==i);
        currentRow = rowNumbersY(j);
        colormap 'gray';
        imageFileName=[imageBaseName,num2str(j),'.png'];
        saveas(image(reshape(X(currentRow,:)*255.0, 28, 28)'), imageFileName);
          
      end
      images = {'image1.png', 'image2.png', 'image3.png', 'image4.png', 'image5.png', 'image6.png', 'image7.png', 'image8.png', 'image9.png', 'image10.png'};
      montageFileName=[montageBaseName,num2str(i),'.pdf'];
      saveas(montage(images), montageFileName);
  end
  for i = 1:10
    delete([imageBaseName,num2str(i),'.png'])
    end
end