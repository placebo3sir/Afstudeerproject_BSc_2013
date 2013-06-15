 function f= test(number)
 
 run /Users/Capodit3/Downloads/vlfeat-0.9.16/toolbox/vl_setup;
 
 
%      I = imread('coa2.png');
%     J = imread('coa3.jpg');
% 
%     I = single(rgb2gray(I)); % Conversion to single is recommended
%     J = single(rgb2gray(J)); % in the documentation
% 
%     [F1 D1] = vl_sift(I);
%     [F2 D2] = vl_sift(J);
% 
%     % Where 1.5 = ratio between euclidean distance of NN2/NN1
%     [matches score] = vl_ubcmatch(D1,D2,1.5); 
% 
%     subplot(1,2,1);
%     imshow(uint8(I));
%     hold on;
%     plot(F1(1,matches(1,:)),F1(2,matches(1,:)),'b*');
% 
%     subplot(1,2,2);
%     imshow(uint8(J));
%     hold on;
%     plot(F2(1,matches(2,:)),F2(2,matches(2,:)),'r*');
%    ------------------------------------------------------------------


% im1 = imread('coa2.png');
% im2 = imread('coa3.jpg');
% 
% BW = imread('coa2.png');
% I = imread('coa3.jpg');
% SE = eye(5);
% imagesc(I);
% figure;
% size(I)
% % f = inline('imadjust(x,[],[],0.3)');
% % I2 = roifilt2(I,BW,f);
% imshow(I(:,:,1));
% figure;
% imshow(I(:,:,2));
% figure;
% imshow(I(:,:,3));
% figure;
% imshow(I);

%% OUTPUT
% 
    
%  if (number == 1)
%     Ia = vl_impattern('coa2');
%     Ib = vl_impattern('coa3');
%  else
%     Ia = vl_impattern('coa_hog');
%     Ib = vl_impattern('coa_hog2');
%  end
% 
%          rows1 = size(Ia,1);
%     rows2 = size(Ib,1);
% 
%     if (rows1 < rows2)
%          Ia(rows2,1) = 0;
%     else
%          Ib(rows1,1) = 0;
%     end
% 
%     % Now append both images side-by-side.
%     im = [Ia Ib];
% 
%     image(im);
%  
% Ia = single(rgb2gray(Ia)) ;
% Ib = single(rgb2gray(Ib)) ;
% 
% cellSize = 8 ;
% 
% if (number == 1)
%     [fa, da] = vl_sift(Ia) ;
%     [fb, db] = vl_sift(Ib) ;
%     [matches, scores] = vl_ubcmatch(da, db) ;
%     
%         hold on
%     perm = randperm(size(matches,2)) ;
%     size(perm)
%     sel = perm(1:3) ;
%     h1 = vl_plotframe(matches(:,sel)) ;
%     h2 = vl_plotframe(matches(:,sel)) ;
%     set(h1,'color','k','linewidth',3) ;
%     set(h2,'color','y','linewidth',2) ;
%     hold off
%             else if (number == 2)
%                      I = single(rgb2gray(imread('Coa.jpg'))); % read the image
%                hautoth = vision.Autothresholder; 
%                size(I);
%                BW = step(hautoth, I);   % threshold the image
%                [y, x]= find(BW,1);      % select a starting point for the trace
% 
%                % Determine the boundaries
%                  hboundtrace = vision.BoundaryTracer; 
%                  PTS = step(hboundtrace, BW, [x y]);
% 
%                % Display the results
%                  figure, imshow(BW); 
%                  hold on; plot(PTS(:,1), PTS(:,2), 'r', 'Linewidth',2);
%                  hold on; plot(x,y,'gx','Linewidth',2); % show the starting poin
%             else if (number == 3)
%                     hedge = vision.EdgeDetector;
%                      hcsc = vision.ColorSpaceConverter(...
%                              'Conversion', 'RGB to intensity');
%                      hidtypeconv = ...
%                        vision.ImageDataTypeConverter('OutputDataType','single');
%                      img = step(hcsc, imread('Coa3.jpg'));
%                      img1 = step(hidtypeconv, img);
%                      edges = step(hedge, img1);
%                      imshow(edges);
%             else
%                     hog = vl_hog(Ia, cellSize, 'verbose') ;
%                 imhog = vl_hog('render', hog, 'verbose') ;
% 
%                     hog2 = vl_hog(Ib, cellSize, 'verbose') ;
%                 imhog2 = vl_hog('render', hog2, 'verbose') ;
% 
%                 rows1 = size(imhog,1);
%                 rows2 = size(imhog2,1);
% 
%                 if (rows1 < rows2)
%                      imhog(rows2,1) = 0;
%                 else
%                      imhog2(rows1,1) = 0;
%                 end
% 
%                 % Now append both images side-by-side.
%                 im = [imhog imhog2];
%                 clf ; imagesc(imhog2) ; colormap gray ;
% 
%                 end
%                 end
% end

end