binaryImage = im2';
bpImage = bwmorph(binaryImage, 'Branchpoints');
epImage = bwmorph(binaryImage, 'Endpoints');
% Plot blue circles over branchpoints
[ybp, xbp] = find(bpImage);
hold on;
plot(xbp, ybp, 'bo', 'MarkerSize', 15);
% Plot red circles over endpoints.
[yep, xep] = find(epImage);
hold on;
plot(xbp, ybp, 'ro', 'MarkerSize', 15);
