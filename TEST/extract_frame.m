clear all;
clc
addpath('mmread');
video = mmread('data/combo.mp4');
f=video.frames;
num=numel(f);
mkdir data/gray
 cd data/gray;
for k = 1:num
   
   imageData=rgb2gray(f(k).cdata);
   %imshow(imageArray);  % Display image.
 
  imwrite (imageData,sprintf('%05d.png',k));

end
