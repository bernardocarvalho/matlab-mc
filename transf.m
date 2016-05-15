function [R] = transf(theta)

R(1,1) = cos(theta);
R(1,2) = sin(theta);
R(2,1) = -sin(theta);
R(2,2) = cos(theta);

R(3,3) = cos(theta);
R(3,4) = sin(theta);
R(4,3) = -sin(theta);
R(4,4) = cos(theta);

R(5,5) = cos(theta);
R(5,6) = sin(theta);
R(6,5) = -sin(theta);
R(6,6) = cos(theta);
