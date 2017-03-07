%letterneuralnet
%{ means none
%neural network will have 128 + 1 input units, 45 hidden units and 26
%output units
%theta1 = 129*45
%theta2 = 44*26
input_layer_size  = 128;  % 20x20 Input Images of Digits
hidden_layer_size = 44;   % 25 hidden units

epsilon_init = 0.12;
num_labels =  27;

n_iter = 600;


X = CTraining2;%training set
y = CTrainingY;

Theta1 = rand(44,129)*2*epsilon_init - epsilon_init;
Theta2 = rand(27,45)*2*epsilon_init - epsilon_init;
nn_params = [Theta1(:) ; Theta2(:)];
lambda = 1.5;

J = CostFunction(nn_params,input_layer_size, ...
                                   hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Cost at parameter: %f '...
         '\n'], J);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nTraining Neural Network... \n')

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', n_iter);

%  You should also try different values of lambda
lambda = 2;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) CostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;




%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

[~,pred] = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

pause;

%TEST
X = CTest2;%test set
y = CTestY;
pred = predict(Theta1, Theta2, X);

fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == y)) * 100);