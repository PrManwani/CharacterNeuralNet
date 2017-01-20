function g = sigmoidGradient(z)


g = zeros(size(z));

a = sigmoid(z);
b = ones(size(z))-a;
g = a.*b;












% =============================================================




end
