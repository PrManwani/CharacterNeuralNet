%TEST
X = (reshape(testimgs(:,:,:),[400,10000]))';%test set
y = testlabels;
pred = predict(Theta1, Theta2, X);

fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == y)) * 100);