function [letter, remain,count,covered] = letterwisecroppredict2(im2,count,covered,Theta1,Theta2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
imshow(im2)
m1 = size(im2,1);
m2 = size(im2,2);
s1 = 0;
xmax = 0;
xmin = 0;
i = 0;
flag =0;
while((xmax==0 || xmin ==0) && i<m2)
    i= i+1;
    covered = covered+1
    s1 =  sum(im2(:,i));                
    if(s1>5 && flag ==0)
        xmin = i;
        flag=1;
    end    
    if(s1==0 && flag==1)
        xmax = i;
    end
end
im3 = imcrop(im2,[xmin 0 (xmax-xmin) m1]);
i = 0;
flag =0;
ymin = 0;
ymax =0;
a =0;
b=0;
while(i<m1 && flag < 2)
    i= i+1;
    s1 =  sum(im3(i,:));
    if(s1>0 && a==0)
        ymin = i;
        a=a+1;
    end
    s2 = sum(im3(m1+1-i,:));
    if(s1>0 && a==0)
        ymin = i;
        a=a+1;
    end
    if(s2>0 && b==0)
        ymin = i;
        b=b+1;
    end
    flag = a+b;
end



im4 = imcrop(im2,[xmin ymin (xmax-xmin-2) (ymax-ymin-2)]);
%prediction starts
remain = imcrop(im2,[xmax 0 m2 m1]);
im4 = imresize(im4',[8 16]);
imshow(im4');
pause;
x = reshape(im4, [128,1]);
[a,b] = predict(Theta1,Theta2,x');
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

