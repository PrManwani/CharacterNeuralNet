%ARINDHAM CHU KUCH KAR
im = imread('alpha2.jpg');

im = rgb2gray(im);
im = im < 100;
count = 0;

height = size(im,1);
length = size(im,2);
coveredx = 0;
coveredy = 0;
c = 1;
while(coveredy<height-10)
    [im2,remainline,coveredy]=cropline(im,coveredy);
    imshow(im2);
    pause;
    coveredx = 0;
    while (coveredx<length-10)
        [x,remain,count,coveredx] = letterwisecroppredict(im2,count,coveredx);
        im2 = remain;
        Training(c,:) = x;
        c = c+1;
    end
    im = remainline;                    
end