function hog = hog_features_abstraction(im)

run /Users/Capodit3/Downloads/vlfeat-0.9.16/toolbox/vl_setup;

% --------------------------------------------------------------------
%                                                 Compute HOG features
% --------------------------------------------------------------------
im = imread(fullfile(vl_root,'data',strcat('coa/', im))) ;
im = im2single(im) ;

% A(:,:,1) = ones(2,2);
% A(:,:,2) = 2*ones(2,2);
% A(:,:,3) = 3*ones(2,2);
% 
% im = permute(A,[1 3 2]);
% im = reshape(im,[],size(A,2),1);

% Standard features
cellSize = 8 ;
hog = vl_hog(im, cellSize, 'verbose', 'numOrientations', 8) ;
imhog = vl_hog('render', hog, 'verbose', 'numOrientations', 8) ;

clf ; imagesc(imhog) ; colormap gray ;


% im = im(1:128,end-128+1:end,:) ;

bw = im2bw(imhog, graythresh(imhog));
bw2 = imfill(bw, 'holes');
bw2 = bw2 >= 0.9;
L = bwlabel(bw2);
% imshow(bw>=1);
% subplot(1,2,2) ;
% [r, c] = find(imhog>=0.9);
% rc = [r c];

stats = regionprops(L,{'BoundingBox', 'Centroid'});
hold on
figure(11);
imagesc(bw);axis image off ; colormap gray ;
size(bw2);
title('Testing');
for object = 1 : length(stats)
    bb = stats(object).BoundingBox;
    if (( bb(:,1) > 100 && bb(:,1) < 200 ||... % left
            bb(:, 1) > 200 && bb(:, 1) < 700 ||... % middle
            bb(:, 1) > 700  )&&... % right
            bb(:,3) > 150 && bb(:,4) > 80 && bb(:,3) < 500) 
    rectangle('Position',bb,'EdgeColor','g', 'Curvature',[0.8,0.4], ...
    'LineWidth',2)
    end
    
    if(bb(:, 1) > 200 && bb(:, 1) < 700 &&...
            bb(:,3) > 100 && bb(:,4) > 80)... % middle
        
    newImage = strcat('middle', object, '.jpg');
%     imwrite(bb, newImage);
    end
end
hold off

% Get permutation to flip a HOG cell from left to right
% --------------------------------------------------------------------
%                                                    Flip HOG features
% --------------------------------------------------------------------

% hog = vl_hog(im, cellSize) ;
% hogFromFlippedImage = vl_hog(im(:,end:-1:1,:), cellSize) ;
% perm = vl_hog('permutation') ;
% flippedHog = hog(:,end:-1:1,perm) ;
% 
% imHog = vl_hog('render', hog) ;
% imHogFromFlippedImage = vl_hog('render', hogFromFlippedImage) ;
% imFlippedHog = vl_hog('render', flippedHog) ;
% 
% figure ; clf ;
% subplot(1,3,1) ; imagesc(imHog) ;
% axis image off ; title('HOG features') ;
% subplot(1,3,2) ; imagesc(imHogFromFlippedImage) ;
% axis image off ; title('Flipping the image') ;
% subplot(1,3,3) ; imagesc(imFlippedHog) ;
% axis image off ; title('Flipping the features') ;
% colormap gray ;
% vl_demo_print('coat_flipping',1) ;

% --------------------------------------------------------------------
%                                                 Other HOG parameters
% --------------------------------------------------------------------

% figure(5) ; clf ;
% numOrientationsRange = [3, 4, 5, 9, 21] ;
% for i = 1:numel(numOrientationsRange)
%   vl_tightsubplot(1, numel(numOrientationsRange), i) ;
%   o = numOrientationsRange(i) ;
%   hog = vl_hog(im, cellSize, 'verbose', 'numOrientations', o) ;
%   imhog = vl_hog('render', hog, 'verbose', 'numOrientations', o) ;
%   imagesc(imhog) ;
%   axis image off ;
%   colormap gray ;
% end
% vl_demo_print('hog_num_orientations',.9) ;
% 
% figure(6) ; clf ;
% [x,y] = meshgrid(linspace(-1,1,128)) ;
% im = single(sqrt(x.^2+y.^2)) ;
% hog1 = vl_hog(im,cellSize,'numOrientations', 4) ;
% hog2 = vl_hog(im,cellSize,'numOrientations', 4,'bilinearOrientations') ;
% imhog1 = vl_hog('render',hog1,'numOrientations', 4) ;
% imhog2 = vl_hog('render',hog2,'numOrientations', 4) ;
% 
% subplot(1,3,1) ; imagesc(im) ;
% axis image off ; title('Input image') ;
% subplot(1,3,2) ; imagesc(imhog1) ;
% axis image off ; title('Hard orientation assignments') ;
% subplot(1,3,3) ; imagesc(imhog2) ;
% axis image off ; title('Soft orientation assignments') ;
% colormap gray ;
% vl_demo_print('coat_hog_bilinear_orientations',1) ;

end