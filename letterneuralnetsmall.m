%2nd letterneuralnet
%{ means none
%neural network will have 128 + 1 input units, 70 1st layer hidden units, 44 2nd layer hidden units and 27
%output units
%theta1 = 129*100
%theta2 = 101*75
%theta3 = 76*27
input_layer_size  = 131;
hidden_layer1_size = 70;
hidden_layer2_size = 49;


epsilon_init = 0.12;
num_labels =  27;

%n_iter = 600;

X = CTrainingaf;
m = size(CTrainingaf,1);
for k=1:m
    X(k,:) = X(k,:) - mean(X(k,:));
 end%training set
y = CTraining2Y;
a = input('Is it your first time training');
if(a==1)
    Theta1 = rand(hidden_layer1_size,input_layer_size+1)*2*epsilon_init - epsilon_init;
    Theta2 = rand(hidden_layer2_size,hidden_layer1_size+1)*2*epsilon_init - epsilon_init;
    Theta3 = rand(num_labels,hidden_layer2_size+1)*2*epsilon_init - epsilon_init;
    nn_params = [Theta1(:) ; Theta2(:); Theta3(:)];
end
lambda = 1.5;
b = input('choose activation function in hidden layer: 1 for sigmoid, 2 for hyperbolic tan, 3 for relu');
J = CostFunction(nn_params,input_layer_size, ...
    hidden_layer1_size, ...
    hidden_layer2_size, ...
    num_labels, X, y, lambda,b);


fprintf(['Cost at parameter: %f '...
         '\n'], J);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
n_iter = input('how many iterations');
flag = 0;
a = 80;
while(flag==0)
options = optimset('MaxIter', n_iter);

%  You should also try different values of lambda
lambda = 2;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) CostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   hidden_layer2_size, ...
                                   num_labels, X, y, lambda,b);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer1_size * (input_layer_size + 1)), ...
                 hidden_layer1_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer1_size * (input_layer_size + 1))):((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))), ...
                 hidden_layer2_size, (hidden_layer1_size + 1));

Theta3 = reshape(nn_params((1+((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))):end), ...
                 num_labels, (hidden_layer2_size + 1));


fprintf('Program paused. Press enter to continue.\n');




%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict3layer(Theta1, Theta2, Theta3, X, b);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


%TEST
X1 = CTestaf;%test set
m = size(CTestaf,1);
for k=1:m
    X1(k,:) = X1(k,:) - mean(X(k,:));
 end%training set
y1 = CTest2Y';
pred = predict3layer(Theta1, Theta2,Theta3, X1, b);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == y1)) * 100);

if(( mean(double(pred == y1)) * 100)<a)
    flag = 1;
end
a = mean(double(pred==y1))*100;
end