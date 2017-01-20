im3 = imcrop(im2);
imshow(im3);
im4 = imresize(im3',[8 16]);
imshow(im4);
x = reshape(im4, [1,128]);
predict(Theta1,Theta2,x)