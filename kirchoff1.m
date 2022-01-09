% Homework 6: Evaluating and Calculating With Kirchoff's Law
% Felix An (3210300239), ZJU
clear all;

% Set the given value of r, and declare the symbols i, u0, im2
r = 1.0;
syms i u0 im2;

% Enter the three linear equations
eq1 = 0.5*1.5*r == i*r+1.5*i*r;
eq2 = 14 == i*r+(im2-0.5*i)*r+u0;
eq3 = u0 == 1.5*i*r+im2*r;

% Solve for i, u0, im2 and print the answer
sol = solve([eq1, eq2, eq3], [i, u0, im2]);
fprintf("i = %s\n", char(sol.i));
fprintf("U0 = %s\n", char(sol.u0));
fprintf("Im2 = %s\n", char(sol.im2));

% Calculate u and print the answer
u = 1.5*sol.i*r;
fprintf("U = %s\n", char(u));