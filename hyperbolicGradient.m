function g = hyperbolicGradient(z)


g = zeros(size(z));

a = tanh(z);
g = ones(size(z))-(a.^2);


