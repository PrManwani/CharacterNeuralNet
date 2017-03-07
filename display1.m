m = size(CTraining2,1);
while(1)
    i = round(46152*rand(1),0);
    CTraining2Y(i)
    im = CTraining2(i,:);
    predict3layer(Theta1,Theta2,Theta3,im)
    im2 = reshape(im,[8 16]);
    im3 = strokewidth(im2);
    imshow(im3');   
    pause;
    [~,~,N,~] = bwboundaries(im3',8,'holes');
    N
    
%     hold off;
%     se = strel('line',1,45);
%     im4 = imdilate(im3,se);

%     figure(1)
%     subplot(1,3,1)
%     imshow(im2')
%     title('Region Image')
% 
%     subplot(1,3,2)
%     imshow(im3')
%     title('Stroke Width Image')
%     
%     subplot(1,3,3)
%     imshow(im4')
%     title('Stroke Width dilated Image')
%     pause;
%     
end
