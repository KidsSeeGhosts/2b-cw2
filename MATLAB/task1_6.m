%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
 load(MAT_ClusterCentres);
 k = size(C,1);
 montageFileName = ['task1_6_imgs_',num2str(k),'.pdf'];
 clusterBaseName = 'cluster';
 clusterNames = cell(k,1);
 colormap 'gray';
 for i = 1:k
    clusterName = [clusterBaseName,num2str(i),'.png'];
    saveas(image(reshape(C(i,:)*255.0, 28, 28)'),clusterName);
    clusterNames{i} = [clusterName];
 end 
 saveas(montage(clusterNames), montageFileName);
 for i = 1:10
    delete([clusterBaseName,num2str(i),'.png'])
    end
end