t=0.15; %信号保持时间
ts=1/1500; %采样时间间隔
fc=250; %载波频率
fs=1/ts; %采样频率
df=0.3; %频率分辨率
t1=[0:ts:t]; %时间矢量
m=[ones(1,t/(3*ts)),-2*ones(1,t/(3*ts)),zeros(1,t/(3*ts)+1)]; %定义信号序列
c=cos(2*pi*fc.*t1); %载波信号
amp=3; %载波幅度,可以设为0,无载波
u=m.*c+amp*c; %调制
y=u.*c; %解调
[n,m,df1]=fftseq(m,ts,df); %傅里叶变换
n=n/fs;
[ub,u,df1]=fftseq(u,ts,df);
ub=ub/fs;
[Y,y,df1]=fftseq(y,ts,df);
Y=Y/fs;
f_c_off=150; %滤波器的截止频率
n_c_off=floor(150/df1); %设计滤波器
f=[0:df1:df1*(length(m)-1)]-fs/2; %频率矢量
h=zeros(size(f));
h(1:n_c_off)=2*ones(1,n_c_off);
h(length(f)-n_c_off+1:length(f))=2*ones(1,n_c_off);
dem1=h.*Y; %滤波器输出的频率
dem=real(ifft(dem1))*fs; %滤波器的输出
subplot(231);
plot(t1,m(1:length(t1))); %基带信号
title('基带信号');
subplot(232);
plot(t1,u(1:length(t1))); %已调信号
title('已调信号');
subplot(233);
plot(t1,dem(1:length(t1))); %解调信号
title('解调信号');
subplot(234);
plot(f,abs(fftshift(n))); %未解调信号信号频谱
title('基带信号频谱');
subplot(235);
plot(f,abs(fftshift(ub))); %已调信号频谱
title('已调信号频谱');
subplot(236);
plot(f,abs(fftshift(dem1))); %解调信号信号频谱
title('解调信号频谱');
