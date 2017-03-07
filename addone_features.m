function [addedfeaturesimage] = addone_features(trainingimage)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
im = trainingimages(:);
im = reshape(im,[8 16]);
imshow(im');
pause;
im = im';
%im = strokewidth(im);
[~,~,ncb,~] = bwboundaries(im,8,'holes');
binaryImage = im;
bpImage = bwmorph(binaryImage, 'Branchpoints');
epImage = bwmorph(binaryImage, 'Endpoints');
% Plot blue circles over branchpoints
[ybp, xbp] = find(bpImage);
%         hold on;
%         plot(xbp, ybp, 'bo', 'MarkerSize', 15);
n_bp = size(xbp,1);
%       pause;
%Plot red circles over endpoints.
[yep, xep] = find(epImage);
%         plot(xep, yep, 'ro', 'MarkerSize', 15);
%         pause;
n_ep = size(xep,1);
addedfeaturesimage(c,:) = [trainingimages(c,:) n_ep n_bp ncb];
end

