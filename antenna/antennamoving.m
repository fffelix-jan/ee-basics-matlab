clc; 								%清除命令窗口的内容
clear all;							%清除工作空间的所有变量；
%参数设置
for ia=0:360
f=10*10^9; 						%频率为10GHz
c=3*10^8; 						%真空中的光速
lmd=c/f; 							%波长
k=2*pi/lmd; 						%传播常数
eta=120*pi; 						%波阻抗，常数
rho=1000*lmd; 					%以距离原点1000*lambda的球面上的场作为远场
syms phi
N=4; 							%阵列中单元个数
d=lmd/4; 						%阵元间距
%相位差
%PhaseDifference=input('PhaseDifference(度, 可正负)='); 	
%输入天线单元间的相位差
PhaseDifference=ia;
PhaseDifference=PhaseDifference*pi/180; 					%转化为弧度
Et=0;
for i=1:N
  x=(i-N/2-0.5)*d; 									%第i个天线单元离原点距离
  r=sqrt(rho*rho+x*x-2*rho*x*cos(phi)); 					%第i个天线单元离P点距离
  Et=Et+j*k*eta*exp(-j*k*r)/4/pi/r*exp(j*(i-1)*PhaseDifference);%N个天线单元的叠加电场
end
%phi取0到360度
t1=linspace(0,2*pi,200);
Et_num=double(vpa(subs(Et,phi,t1)));
Et_num_abs=abs(Et_num); 			%电场幅度
%画图
figure(1)
polar(t1,Et_num_abs/max(Et_num_abs));
title(['N=8, d={\lambda}/4,{\Psi}=',num2str(PhaseDifference*180/pi),'{\circ}']);
set(figure(1),'color',[1 1 1]);
%pause(0.5);
end
