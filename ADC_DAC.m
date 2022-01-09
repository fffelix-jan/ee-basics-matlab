%%
% part1:signal
t=0:0.001:2;    %原始信号的采样点需要足够密集，即用非常密集的离散点代表原始模拟信号
x=5*sin(2*pi*t)+2*sin(3*pi*t)+3*sin(4*pi*t);
Amp=max(x);     %找到最大幅值
x=x/Amp*255;    %幅值放大至255
floor(x);       %向下取整数
figure(1);
plot(t,x);
xlabel('t/s');ylabel('x(t)');title('原始模拟信号x(t)');

%%
% part2:ADC

T=0.1;          %采样时间
%T=0.25;        %不同的采样时间选择
%T=0.4;

t=0:T:2;        %生成采样点序列
x=5*sin(2*pi*t)+2*sin(3*pi*t)+3*sin(4*pi*t);
Amp=max(x);     %找到最大幅值
x=x/Amp*255;    %幅值放大至255
floor(x);       %向下取整数
figure(2);
subplot(2,1,1);
plot(t,x);      %一阶保持
xlabel('t/s');ylabel('x(t)');title(strcat('模拟信号x(t)的ADC变换（一阶保持）T=', num2str(T)));
subplot(2,1,2);
stairs(t,x);    %零阶保持（更佳）
xlabel('t/s');ylabel('x(t)');title(strcat('模拟信号x(t)的ADC变换（零阶保持）T=', num2str(T)));

%%
% part3:DAC
xi=linspace(0,2,100);   %恢复信号的点数
yi=spline(t,x,xi);      %内插处理恢复原始信号
figure(3);
plot(t,x,'o',xi,yi);    %恢复出的模拟信号在数字信号的离散采样点序列图像中共同画出
xlabel('t/s');ylabel('x(t)');title(strcat('数字信号x(t)的DAC变换（三条样条内插）T=', num2str(T)));
