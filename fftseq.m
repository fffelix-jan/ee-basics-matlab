function [M,m,df]=fftseq(m,tz,df)
%返回量为M,m,df
%M为由时间序列m经过采样和傅立叶变换后的序列,长度为2的幂
%df为要求的分辨率
%tz为采样的时间间隔
fz=1/tz;
%fz为采样频率
if nargin==2 %判断输入参数的个数是否符合要求
  n1=0;
else
  n1=fz/df; %根据参数个数决定是否使用频率缩放
end
n2=length(m);%返回m序列的长度
n=2^(max(nextpow2(n1),nextpow2(n2)));
%取不小于n1及n2的2的幂中更小的那个
M=fft(m,n); %进行离散傅里叶变换
%fft()函数所要求的信号长度为2的幂
m=[m,zeros(1,n-n2)];%m序列中n大于原时间序列的部分用0补齐
df=fz/n;%更新结果的df
