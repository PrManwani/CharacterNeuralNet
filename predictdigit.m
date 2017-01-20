%input images
img = imread('6.jpg');
im = rgb2gray(img);
im = im<100;
im2 = imresize(im, [20,20]);
im2 = reshape(im2,[400,1]);
im2 = im2'
im2label  = predict(Theta1,Theta2,im2)


