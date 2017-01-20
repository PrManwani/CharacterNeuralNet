function [J grad s2] = CostFunction(nn_params,input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels,X,y,lambda)
                                                
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
J = 0;

m = size(y,1);

X = [ones(m,1) X];
z1 = X*Theta1';
a1 = sigmoid(z1);
h1 = [ones(m,1) a1];

z2 = h1*Theta2';
h2 = sigmoid(z2);


b = zeros(m,num_labels);

for w = 1:num_labels
    b(:,w) = (y==w);    
end
y = b;   
    
    
for i = 1:m
    cost_for_1 = ((-y(i,:))*(log(h2(i,:))') - (1-y(i,:))*((log(1 - h2(i,:)))'));
    J = J + cost_for_1;
end
J = J/m;

sum_reg =(lambda/(2*m))*(sum(sum((Theta1(:,(2:end))).^2)) + sum(sum((Theta2(:,(2:end))).^2)));
J = J + sum_reg;

%backpropagation
delta_3 = h2 - y;

delta_2 = (delta_3*Theta2).*(sigmoidGradient([ones(size(z1,1), 1) z1]));

delta_2 = delta_2(:,2:end);
s1 = delta_2'*(X);

s2 = delta_3'*(h1);


Theta1_grad = (s1/m) + (lambda / m) * [zeros(size(Theta1,1),1) Theta1(:,2:end)];
Theta2_grad = (s2/m)+ (lambda / m)* [zeros(size(Theta2,1),1) Theta2(:,2:end)];

grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
       