function [p] = predict3layer(Theta1, Theta2,Theta3, X, s)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta3, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
if(s==1)
h1 = sigmoid([ones(m, 1) X] * Theta1');
%h1 = tanh([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
%h2 = tanh([ones(m, 1) h1] * Theta2');
h3 = sigmoid([ones(m, 1) h2] * Theta3');
%h3 = tanh([ones(m, 1) h2] * Theta3');
elseif(s==2)
%h1 = sigmoid([ones(m, 1) X] * Theta1');
h1 = tanh([ones(m, 1) X] * Theta1');
%h2 = sigmoid([ones(m, 1) h1] * Theta2');
h2 = tanh([ones(m, 1) h1] * Theta2');
h3 = sigmoid([ones(m, 1) h2] * Theta3');
%h3 = tanh([ones(m, 1) h2] * Theta3');
end
[~, p] = max(h3, [], 2);
% s = sum(h3);
% h3 = h3.*100/s;
% h3 = h3';
% h3;
% s2 = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27];
% s2 = s2+96;
% percentages = [s2 h3];

end
