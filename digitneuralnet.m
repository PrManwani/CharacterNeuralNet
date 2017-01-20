%0 is represented by 10
%neural network will have 400 + 1 input units, 25 hidden units and 10
%output units
%theta1 = 401*25
%theta2 = 26*10
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units

epsilon_init = 0.12;
num_labels =  10;

n = size(trimgs,3);
X = (reshape(trimgs(:,:,:),[400,n]))';%training set
y = trlabels;

Theta1 = rand(25,401)*2*epsilon_init - epsilon_init;
Theta2 = rand(10,26)*2*epsilon_init - epsilon_init;
nn_params = [Theta1(:) ; Theta2(:)];
lambda = 1;

J = CostFunction(nn_params,input_layer_size, ...
                                   hidden_layer_size, ...
                   num_labels, X, y, lambda);

fprintf(['Cost at parameters (loaded from ex4weights): %f '...
         '\n'], J);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nTraining Neural Network... \n')

options = optimset('MaxIter', 100);

lambda = 2;

%cost function with change in parameter nn_params
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

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

pause;

%TEST
X = (reshape(testimgs(:,:,:),[400,10000]))';%test set
y = testlabels;
pred = predict(Theta1, Theta2, X);

fprintf('\nTets Set Accuracy: %f\n', mean(double(pred == y)) * 100);
