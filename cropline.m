function [imcroppedline,remainline,coveredy] = cropline(im,coveredy)
m1 = size(im,1);
m2 = size(im,2);
i = 0;
flag =0;
ymin = 0;
ymax =0;
while((((ymax==0)|| ymin ==0) && i<m1))
    i= i+1;
    coveredy = coveredy + 1
    s1 =  sum(im(i,:));
    if(s1>0 && flag ==0)
        ymin = i;
        flag=1;
    end    
    if(s1==0 && flag==1)
        ymax = i;
    end
end
imcroppedline = imcrop(im,[0 ymin m2 (ymax-ymin)]);
remainline = imcrop(im,[0 ymax m2 m1]);