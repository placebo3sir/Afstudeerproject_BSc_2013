function create_trainset()

% curDirlist = dir('.');
% for j = 1:length(curDirlist)
%     curDirlist(j).name
%     if (strcmp(curDirlist(j).name, 'pathNeg'))
%         
        dirlist = dir('*.jpg'); % determine type of image jpg, png, gif
        for i = 1:length(dirlist)
            imageData = imread(dirlist(i).name);
          if (size(imageData,3) == 3)
          imageData = rgb2gray(imageData);
          jpgFilename = strcat('rgb2gray_', dirlist(i).name);
          imwrite(imageData, dirlist(i).name);
          else
              jpgFilename = dirlist(i).name;
          end

          imageData2 = imrotate(imageData,-1,'bilinear','crop'); %rotate image
          imwrite(imageData2, jpgFilename);

          imageData3 = fliplr(imageData);  % flip image left to right
          imwrite(imageData3, jpgFilename);

          imageData4 = imageData'; % transpose image
          imwrite(imageData4, jpgFilename);

        end
%     end
% end

end