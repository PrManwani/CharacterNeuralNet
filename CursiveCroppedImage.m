function [letter,image] =  CursiveCroppedImage(image)  

%image = imread('CursiveTestImage1.jpg');
%image = rgb2gray(image);
im = image;
image = rgb2gray(image);
image = image<100;
image = bwmorph(image,'thin',inf);
%figure
%imshow(image);


[ymax,xmax]= size(image);
xmin=1;
ymin=1;

upperContour = uppercontour(xmax,xmin,ymax,ymin,image);
lowerContour = lowercontour(xmax,xmin,ymax,ymin,image);


xcrop = cursiveCrop(upperContour,lowerContour);
letter = imcrop(image,[xmin,ymin,(xcrop-xmin),(ymax-ymin)]);
image = imcrop(im,[xcrop,ymin,(xmax-xcrop),(ymax-ymin)]);

figure
imshow(letter);

end
