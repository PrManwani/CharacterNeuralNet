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

X = CTrainingaf;%training set
y = CTraining2Y;
a = input('Is it your first time training');
if(a==1)
    Theta1 = rand(hidden_layer1_size,input_layer_size+1)*2*epsilon_init - epsilon_init;
    Theta2 = rand(hidden_layer2_size,hidden_layer1_size+1)*2*epsilon_init - epsilon_init;
    Theta3 = rand(num_labels,hidden_layer2_size+1)*2*epsilon_init - epsilon_init;
    nn_params = [Theta1(:) ; Theta2(:); Theta3(:)];
end
lambda = 1.5;
%b = input('choose activation function in hidden layer: 1 for sigmoid, 2 for hyperbolic tan');
J1 = CostFunction(nn_params,input_layer_size, ...
    hidden_layer1_size, ...
    hidden_layer2_size, ...
    num_labels, X, y, lambda,1);
J2 = CostFunction(nn_params,input_layer_size, ...
    hidden_layer1_size, ...
    hidden_layer2_size, ...
    num_labels, X, y, lambda,2);

fprintf(['Cost at parameter: %f '...
         '\n'], J1);
fprintf(['Cost at parameter: %f '...
         '\n'], J2);
fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
n_iter = input('how many iterations');
options = optimset('MaxIter', n_iter);

%  You should also try different values of lambda
lambda = 2;

% Create "short hand" for the cost function to be minimized
costFunction1 = @(p) CostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   hidden_layer2_size, ...
                                   num_labels, X, y, lambda,1);
                               
costFunction2 = @(p) CostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer1_size, ...
                                   hidden_layer2_size, ...
                                   num_labels, X, y, lambda,2);
% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
nn_params1 = nn_params;
nn_params2 = nn_params;
[nn_params1, cost1] = fmincg(costFunction1, nn_params1, options);
[nn_params2, cost2] = fmincg(costFunction2, nn_params2, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta11 = reshape(nn_params1(1:hidden_layer1_size * (input_layer_size + 1)), ...
                 hidden_layer1_size, (input_layer_size + 1));

Theta21 = reshape(nn_params1((1 + (hidden_layer1_size * (input_layer_size + 1))):((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))), ...
                 hidden_layer2_size, (hidden_layer1_size + 1));

Theta31 = reshape(nn_params1((1+((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))):end), ...
                 num_labels, (hidden_layer2_size + 1));

Theta12 = reshape(nn_params2(1:hidden_layer1_size * (input_layer_size + 1)), ...
                 hidden_layer1_size, (input_layer_size + 1));

Theta22 = reshape(nn_params2((1 + (hidden_layer1_size * (input_layer_size + 1))):((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))), ...
                 hidden_layer2_size, (hidden_layer1_size + 1));

Theta32 = reshape(nn_params2((1+((hidden_layer1_size*(input_layer_size + 1))+...
    (hidden_layer2_size*(hidden_layer1_size + 1)))):end), ...
                 num_labels, (hidden_layer2_size + 1));
fprintf('Program paused. Press enter to continue.\n');
pause;




%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred1 = predict3layer(Theta11, Theta21, Theta31, X, 1);
pred2 = predict3layer(Theta12, Theta22, Theta32, X, 2);

fprintf('\nTraining Set Accuracy1: %f\n', mean(double(pred1 == y')) * 100);
fprintf('\nTraining Set Accuracy2: %f\n', mean(double(pred2 == y')) * 100);

pause;

%TEST
X = CTestaf;%test set
y = CTest2Y;
pred1 = predict3layer(Theta11, Theta21,Theta31, X, 1);
pred2 = predict3layer(Theta12, Theta22, Theta32, X, 2);
fprintf('\nTest Set Accuracy1: %f\n', mean(double(pred1 == y')) * 100);
fprintf('\nTest Set Accuracy2: %f\n', mean(double(pred2 == y')) * 100);
