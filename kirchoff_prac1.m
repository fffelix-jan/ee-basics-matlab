clear all;

syms i1 i2 i3;

eq1 = 10-5*i1-2*i3==0;
eq2 = 20-10*i2-2*i3==0;
eq3 = i1 + i2 - i3 == 0;

sol = solve([eq1,eq2,eq3], [i1,i2,i3]);
fprintf("i1 = %f\n", sol.i1);
fprintf("i2 = %f\n", sol.i2);
fprintf("i3 = %f\n", sol.i3);