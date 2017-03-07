im = imread('alpha2.jpg');

im = rgb2gray(im);
im = im < 100;
count = 0;

height = size(im,1);
length = size(im,2);
coveredx = 0;
coveredy = 0;
word = [];
while(coveredy<height-10)
    [im2,remainline,coveredy]=cropline(im,coveredy);
    imshow(im2);
    pause;
    coveredx = 0;
    while (coveredx<length-10)
        [letter,remain,count,coveredx] = letterwisecroppredict(im2,count,coveredx,Theta1,Theta2,Theta3);
        im2 = remain;
        newword(:,count) = letter;
    end
    im = remainline;                    
end
% [letter,remain,count,covered] = letterwisecroppredict(im2,count,length,covered,Theta1,Theta2);
% pause;
% im2 = remain;

% imshow(im2)
% pause;
% word(:,count) = letter;
% [letter,remain,count,covered] = letterwisecroppredict(im2,count,length,covered,Theta1,Theta2);
% pause;
% im2 = remain;
% imshow(im2)
% pause;
% word(:,count) = letter;
% [letter,remain,count,covered] = letterwisecroppredict(im2,count,length,covered,Theta1,Theta2);
% pause;
% im2 = remain;
% imshow(im2)
% pause;
% word(:,count) = letter;
% [letter,remain,count,covered] = letterwisecroppredict(im2,count,length,covered,Theta1,Theta2);
% pause;
% im2 = remain;
% imshow(im2)
% pause;
% word(:,count) = letter;

char(newword)


% s1 = 0;
% xmax = 0;
% xmin = 0;
% i = 0;
% flag =0;
% while(xmax==0 || xmin ==0)
%     i= i+1;
%     s1 =  sum(im2(:,i));
%     if(s1>5 && flag ==0)
%         xmin = i;
%         flag=1;
%     end    
%     if(s1==0 && flag==1)
%         xmax = i;
%     end
% end
% im3 = imcrop(im2,[xmin 0 (xmax-xmin) m2])
% i = 0;
% flag =0;
% ymin = 0;
% ymax =0;
% while(ymax==0 || ymin ==0)
%     i= i+1;
%     s1 =  sum(im3(i,:))
%     if(s1>0 && flag ==0)
%         ymin = i;
%         flag=1;
%     end    
%     if(s1==0 && flag==1)
%         ymax = i;
%     end
% end
% im4 = imcrop(im2,[xmin ymin (xmax-xmin) (ymax-ymin)]);
% remain = imcrop(im2,[xmax 0 m2 m1]);
% imshow(remain);
% pause;
% im4 = imresize(im4',[8 16]);
% imshow(im4);
% x = reshape(im4, [128,1]);
% [a,b] = predict(Theta1,Theta2,x');
% a;
% b
% c = b(:,2);
% answers = zeros(3,1);
% for i =1:3
%     [cv,ci] = max(c);
%     if(cv>20)      
%         answers(i) = ci;
%         c(ci) = c(ci) - 100;
%     end
% end
% d = char(answers+96)

     
      
        
        
        
        
%     for j = 1:i
%         %length = m1/i
%         %depth = m2
%         newboundary = round((m2/i)*j)
%         length = (newboundary - oldboundary);
%         im3 = imcrop(im2,[oldboundary 20 length 80]);
% %         imshow(im3);
% %         pause;
%         if(length >= 16)            
%             im4 = imresize(im3',[8 16]);
%             %imshow(im4);
%             %pause;
%             x = reshape(im4, [1 128]);
%              = predict(Theta1,Theta2,x);
%             store(i,j) = a;
%             i
%         end
%         oldboundary = newboundary;
%     end
% end
% s = char(store+96)
% 
% 
