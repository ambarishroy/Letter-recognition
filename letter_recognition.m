%% Read Image
Inputimage=imread('word.jpg');
%% Show image
figure(1)
imshow(Inputimage);
title('INPUT IMAGE')
pause(1);
%% Convert to gray scale
if size(Inputimage,3)==3 % RGB image
 Inputimage=rgb2gray(Inputimage);
 figure(2), imshow(Inputimage);
 title('GRAYSCALE IMAGE')
 pause(1);
end
%% Convert to binary image
threshold = graythresh(Inputimage);
Inputimage =~im2bw(Inputimage,threshold);
figure(3), imshow(Inputimage);
title('BINARY IMAGE')
pause(1);
%% Remove all object containing fewer than 30 pixels
Inputimage = bwareaopen(Inputimage,30);
figure(4), imshow(Inputimage);
pause(1);
%% Label connected components
[L ,Ne]=bwlabel(Inputimage);
propied=regionprops(L,'BoundingBox');
imshow(~Inputimage);
hold on
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
  title('LABELLED IMAGE');
end
hold off
pause (1);
%% Objects extraction
figure
for n=1:Ne
  [r,c] = find(L==n);
  n1=Inputimage(min(r):max(r),min(c):max(c));
  figure,imshow(~n1);
  title('EXTRACTED IMAGES')
  pause(0.5)
end