function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
[m, n] = size(X);

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));
theta_size = size(theta, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for row = 1:m
  z = theta' * X(row, :)';
  h = sigmoid(z);
  J = J + (-y(row) * log(h) - (1 - y(row)) * log(1 - h));
end

J = J/m;
J = J + (lambda / (2 * m)) * sum(theta(2:(theta_size)) .^ 2);


z = X * theta;
g = sigmoid(z);
grad(1) = (1 / m) * sum((g - y) .* X(:, 1));

for i = 2:n
  grad(i) = ((1 / m) * sum((g - y) .* X(:, i))) + (lambda / m) * theta(i);
end

% =============================================================

end
