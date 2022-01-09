clear all;

syms i1 i2 i3;

eq1 = i1 + i2 - i3 == -7;
eq2 = 12*i1 - 6*i2 == 42;
eq3 = 6*i2 + 3*i3 == 0;

sol = solve([eq1, eq2, eq3], [i1, i2, i3]);
disp(sol.i1);
disp(sol.i2);
disp(sol.i3);