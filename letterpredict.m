
im = imread('pratik.jpg');
im = rgb2gray(im);
im2 = im < 105;
im3 = imcrop(im2);
imshow(im3);
im4 = imresize(im3',[8 16]);
imshow(im4);
x = reshape(im4, [128,1]);
[a,b] = predict(Theta1,Theta2,x');
a;
b
c = b(:,2);
answers = zeros(3,1);
for i =1:3
    [cv,ci] = max(c);
    if(cv>20)      
        answers(i) = ci;
        c(ci) = c(ci) - 100;
    end
end
d = char(answers+96)
    

