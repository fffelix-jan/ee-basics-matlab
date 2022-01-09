clear all;

syms va vb;

eq1 = (8-va) - va - (va-vb) == 0;
eq2 = (va-vb) + 0.5 * (va-vb) - vb/(1/3) == 0;

sol = solve([eq1, eq2], [va, vb]);
disp(sol.va);
disp(sol.vb);