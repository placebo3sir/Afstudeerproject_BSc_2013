function divide_image(im, vls, hls)

% im = image
% vls = vertical portions ex. vls = 1 = no hl lines
% hls = horizontal portions
% 
px=[-1 0 1;
    -1 0 1;
    -1 0 1];
im= rgb2gray(imread(im));
% im=filter2(px,im);
n=size(im,1);
m=size(im,2);
dl=vls   ; % number of vertical portions
dc=hls  ; % number of horizontal portions
a=fix(n/dl);
b=fix(m/dc);
n0=1;
portion=[];
ii=0;
for k=linspace(a,n,dl)
  m0=1;
  ii= (ii+1);
  jj=0;
  for p=linspace(b,m,dc)
      jj=jj+1;
      im1=im(n0:k,m0:p,:);
      portion{ii,jj}=im1;
      m0=p+1;
  end
  n0=k+1;
end

ii=0;
for k=1:dl
  for p=1:dc
      ii=ii+1;
      subplot(dl,dc,ii);
      imshow(portion{k,p});
      imwrite(portion{2,2}, 'portion.jpg');  %% Saved as 'jpg'
  end
end

end