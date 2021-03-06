function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

b = X * theta;

h = sigmoid(b);

a = (-y' * log(h)) - ((1-y') * log(1-h));

d = 1/m;

t = d * sum(a);

c = 0.5 * lambda / m;

s = theta(2:end).*theta(2:end);

J = t + c * (sum(s));

c = X' * (h-y);

g = d * c;

grad(1) = g(1);

for i = 2:length(grad) 

grad(i) = g(i) + lambda / m * theta(i);

end

% =============================================================

end
