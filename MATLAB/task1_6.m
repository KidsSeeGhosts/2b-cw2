%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
 load(MAT_ClusterCentres);
 k = size(C,1);
 montageFileName = ['task1_6_imgs_',num2str(k),'.pdf'];
 clusters = zeros(28,28,k);
 colormap 'gray';
 for i = 1:k
    clusters(:,:,i) = (reshape(C(i,:), 28, 28)');
 end 
 saveas(montage((flip(clusters,3)),'Thumbnailsize',[112 112]), montageFileName);
end