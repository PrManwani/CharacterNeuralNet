function [imcroppedletter] = cropletter(im)
m1 = size(im,1);
m2 = size(im,2);
xmax = 0;
xmin = 0;
i = 0;
flag =0;
while((xmax ==0 || xmin ==0) && i<m2)
    i= i+1;
    s1 =  sum(im(:,i));                
    if(s1>0 && flag ==0)
        xmin = i;
        flag=1;
    end    
    if(s1==0 && flag==1)
        xmax = i;
    end
    if(i == m2)
        xmax = i;
    end        
end
i = 0;
flag =0;
ymin = 0;
ymax =0;
a =0;
b=0;
while(i<m1 && flag<2)
    i= i+1;
    s1 =  sum(im(i,:));
    if(s1>0 && a==0)
        ymin = i;
        a=1;
    end
    s2 = sum(im(m1+1-i,:));
    if(s2>0 && b==0)
        ymax = m1+1-i;
        b=1;
    end
    if(i==m1)
        ymax = i;
    end
    flag = a+b;
end

imcroppedletter = imcrop(im,[xmin ymin (xmax-xmin) (ymax-ymin)]);