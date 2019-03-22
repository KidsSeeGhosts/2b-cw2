%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
    images = zeros(28,28,10);
  for i = 1:10 
    images(:,:,i) = reshape(EVecs(:,i), 28, 28)';
  end
  saveas(montage(images, 'DisplayRange',[-0.2 0.2],'Thumbnailsize', [112 112]),'task1_4_imgs.pdf');