function [letter, remain,count,covered] = letterwisecroppredict(im,count,covered,Theta1,Theta2,Theta3)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
error = 0;
im = im>0;
m1 = size(im,1);
m2 = size(im,2);
% while((xmax==0 || xmin ==0) && i<m2)
%     i= i+1;
%     covered = covered+1
%     s1 =  sum(im2(:,i));                
%     if(s1>5 && flag ==0)
%         xmin = i;
%         flag=1;
%     end    
%     if(s1==0 && flag==1)
%         xmax = i;
%     end
% end
% im3 = imcrop(im2,[xmin 0 (xmax-xmin) m1]);
% i = 0;
% flag =0;
% ymin = 0;
% ymax =0;
% while((((ymax-ymin)<10)|| ymin ==0) && i<m1)
%     i= i+1;
%     s1 =  sum(im3(i,:));
%     if(s1>0 && flag ==0)
%         ymin = i;
%         flag=1;
%     end    
%     if(s1==0 && flag==1)
%         ymax = i;
%     end
% end
xmax = 0;
xmin = 0;
i = 0;
flag =0;
while((xmax ==0 || xmin ==0) && i<m2)
    i= i+1;
    covered = covered + 1;
    s1 =  sum(im(:,i));
    %global im5
    %im5 = im;
    if(s1>0 && flag ==0)
        xmin = i;
        flag=1;
    end    
    if(s1==0 && flag==1)
        xmax = i;
    end
    if(flag==0)
        error = 1;
    end
    if(i==m2)
        xmax = m2;
    end
end
im2 = imcrop(im,[xmin 0 (xmax-xmin) m1]);
i = 0;
flag =0;
ymin = 0;
ymax =0;
a =0;
b=0;
while(i<m1 && flag<2)
    i= i+1;
    s1 =  sum(im2(i,:));
    if(s1>0 && a==0)
        ymin = i;
        a=1;
    end
    s2 = sum(im2(m1+1-i,:));
    if(s2>0 && b==0)
        ymax = m1+1-i;
        b=1;
    end
    flag = a+b;
end
im4 = imcrop(im,[xmin ymin (xmax-xmin) (ymax-ymin)]);
%prediction starts
remain = imcrop(im,[xmax 0 m2 m1]);
im4 = imresize(im4,[16 8]);
%im4 = strokewidth(im4);
im4= bwmorph(im4, 'thin', 1);
im4 = cropletter(im4);
im4 = imresize(im4,[16 8]);
im4 = im4>0.6;
imshow(im4);
x = reshape(im4', [128,1]);
x = add_features(x');
[a,b] = predictone3layer(Theta1,Theta2,Theta3,x,3);%tanh
% [a,b] = predict(Theta1,Theta2,x');
a;
b;
c = b(:,2);
answers = zeros(3,1);
for i =1:3
    [cv,ci] = max(c);
    if(cv>5)      
        answers(i) = ci;
        c(ci) = c(ci) - 100;
    end
end
count = count+1;
letter = answers+96;
end

