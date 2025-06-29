%%将音乐变为单声道
[x,Fs,bits]=wavread(['D:\FFOutput\' '熊孩子-鲁冰花(伴奏版).wav']);
[y,Fs,bits]=wavread(['D:\FFOutput\' '熊孩子-鲁冰花.wav']);
x1=x(:,1);y1=y(:,1);
x2=x1(1:4500000);y2=y1(1:4500000);
z=y2-x2;%相减后理论上应该为人声
%%
%(实验1)将纯粹的人声与分离后的人声比较
[x1]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_E.wav']);
[y1,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);
n1=length(x1);
n2=length(y1);
t1=1:1:n1;
t2=1:1:n2;
plot(t1,x1,'r');
hold on
plot(t2,y1,'g');
figure
[x2]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_A.wav']);
[y2,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_music.wav']);
n1=length(x2);
n2=length(y2);
t1=1:1:n1;
t2=1:1:n2;
plot(t1,x2,'r');
hold on
plot(t2,y2,'g');
%%
%（实验2）1将分离后的人声与伴奏声合成，再分离，然后观察二次分离后的人声与之前人声的差别.2、观察加入噪声和不加噪声对分离结果的影响
z=x1+x2;
sound(z,Fs);
addpath('bss_eval');
addpath('example');
addpath(genpath('inexact_alm_rpca'));
filename='titon_2_07';
filename1='fen';
wavinA= wavread([filename,'_music1.wav'],[2200001  3600000]);
wavinE= wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal1.wav'],[2200001  3600000]);
wavlength=length(wavinA);
wavinmix=z;
%t=(0:wavlength-1)/Fs;
stft(wavinE,128, 128, 0, 32000);%subplot(2,2,3);
parm.outname=['example' filesep 'output' filesep filename1];
parm.lambda=1;
parm.nFFT=1024;
parm.windowsize=1024;
parm.masktype=1; %1: binary mask, 2: no mask
parm.gain=1;
parm.power=1;
parm.fs=Fs;
Parms=rpca_mask_fun(wavinA,wavinE,wavinmix,parm); % SDR(\hat(v),v),   
w1=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);
[x1]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_E.wav']);
[y1,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen_E.wav']);
n1=length(x1);
n2=length(y1);
n3=length(w1);
t1=1:1:n1;
t2=1:1:n2;
t3=1:1:n3;
plot(t1,x1,'r');
hold on
plot(t2,y1,'g');
hold on
plot(t3,w1,'b');%比较了三个人声（原始、分离一次、分离两次）
%加入噪声对分离结果的影响
z=x1+x2;
n=length(z);
t=1:1:n;
Z = awgn(z,10,'measured'); % Add white Gaussian noise.
plot(t,z,t,Z) % Plot both signals.
legend('Original signal','Signal with AWGN'); 
addpath('bss_eval');
addpath('example');
addpath(genpath('inexact_alm_rpca'));
filename='titon_2_07';
filename1='fen';
filename2='fen2';
wavinA= wavread([filename,'_music1.wav'],[2200001  3600000]);
wavinE= wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal1.wav'],[2200001  3600000]);
wavlength=length(wavinA);
wavinmix=Z;
%t=(0:wavlength-1)/Fs;
stft(wavinE,128, 128, 0, 32000);%subplot(2,2,3);
parm.outname=['example' filesep 'output' filesep filename2];
parm.lambda=1;
parm.nFFT=1024;
parm.windowsize=1024;
parm.masktype=1; %1: binary mask, 2: no mask
parm.gain=1;
parm.power=1;
parm.fs=Fs;
Parms=rpca_mask_fun(wavinA,wavinE,wavinmix,parm); % SDR(\hat(v),v),  

[x1]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen2_E.wav']);
[y1,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen_E.wav']);
n1=length(x1);
n2=length(y1);
t1=1:1:n1;
t2=1:1:n2;
plot(t1,x1,'r');
hold on
plot(t2,y1,'g');
%比较加噪分离后的人声和不加噪分离后的人声 

x1=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);
y1=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_E.wav']);
[w1,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen_E.wav']);
v1=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen2_E.wav']);
n1=length(x1);
n2=length(y1);
t1=1:1:n1;
t2=1:1:n2;
plot(t1,x1,t2,y1,t2,w1,t2,v1);
legend('原始人声','分离一次后的人声','第二次分离后的人声','第二次分离后的人声（加噪声）');
%%
%（实验三）调试参数lambda
filename='titon_2_07';
filename1='fen3';
[z,Fs]=wavread([filename,'_SNR5.wav']);
SVS(z,Fs,1,filename1);

filename1='fen4';
[z,Fs]=wavread([filename,'_SNR5.wav']);
SVS(z,Fs,2,filename1);

filename1='fen5';
[z,Fs]=wavread([filename,'_SNR5.wav']);
SVS(z,Fs,0.5,filename1);

filename1='fen6';
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
SVS(z,Fs,0.5,filename1);

filename1='fen7';
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
SVS(z,Fs,1.5,filename1);

filename1='fen8';
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
SVS(z,Fs,2,filename1);

 filename='titon_2_07';
filename1='fen9';
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
SVS(z,Fs,1.3,filename1);

filename1='fen10';
SVS(z,Fs,1.4,filename1);

filename1='fen11';
SVS(z,Fs,1.6,filename1);
filename1='fen12';
SVS(z,Fs,1.55,filename1);
filename1='fen13';
SVS(z,Fs,0,filename1);
filename1='fen14';
SVS(z,Fs,3,filename1);
filename1='fen15';
SVS(z,Fs,0.3,filename1);
filename1='fen16';
SVS(z,Fs,0.2,filename1);


%比较频谱图和时域图
[x1,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
x2=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen8_E.wav']);
figure;
s1=length(x1);
s2=length(x2);
t1=1:1:s1;
t2=1:1:s2;
plot(t1,x1,'r');
hold on
plot(t2,x2,'g');
legend('原始','分离后lamda=2');
X1 = fft(x1,s1); 
X2 = fft(x2,s2); 
Pyy1 = X1.* conj(X1) / s1; 
Pyy2 = X2.* conj(X2) / s2; 
h1=floor(s1/2); 
h2=floor(s2/2); 
f1=Fs*(0:h1)/s1; 
f2=Fs*(0:h2)/s2; 
figure;
plot(f1,Pyy1(1:h1+1),'r');xlabel('Frequency(Hz)'); 
hold on
plot(f2,Pyy2(1:h2+1),'g');xlabel('Frequency(Hz)'); 
legend('原始','分离后lamda=2');



%小波去噪
y=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen11_E.wav']);
%用小波函数db6对信号进行三层分解
[c,l]=wavedec(y',3,'db6');
%估计尺度为1的噪声标准偏差
sigma=wnoisest(c,l,1);
alpha=2;
%获取消噪过程中的阈值
thr=wbmpen(c,l,sigma,alpha);
keepapp=1;
%对信号进行消噪
yd=wdencmp('gbl',c,l,'db6',3,thr,'s',keepapp);%去噪或者压缩


%平滑处理
[x2,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen11_E.wav']);%lamda=1.6
x3=pinghua(x2);
t=1:1:length(x2);
plot(t,x2,t,x3);legend('原始','平滑');
wavwrite(x3,Fs,['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen11(平滑)_E.wav']);
%%
%(实验四)消声处理（消除歌曲中的人声）
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao.wav']);
 b1=fir1(60,0.0000000000001); %获取低通滤波器的系数
 x1=filter(b1,2,z); %对消声后的信号进行滤波
 x2=z-x1;   
 x21=x2(:,1); %滤波后通道1信号
 x22=x2(:,2); %滤波后通道2信号
 xt1=x21-x22; 
wavwrite(x3,Fs,['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'qimiao(消声1).wav']);

wc=2*300/Fs;
[b1,a1]=butter(6,wc,'low');
x2=filter([b1,a1],2,z); %对消声后的信号进行滤波
 x1=z-x2; 
 x11=x1(:,1);
 x12=x1(:,2);
 xt1=x11-x12; 
wavwrite(xt1,Fs,['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'qimiao(消声2).wav']);


wc=2*15000/Fs;
[b1,a1]=butter(6,wc,'high');
x1=filter(b1,2,z); %对消声后的信号进行滤波
 x11=x1(:,1);
 x12=x1(:,2);
 xt1=x11-x12; 
wavwrite(xt1,Fs,['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'qimiao(消声3).wav']);

%求基频
clc;
tic,
[y,fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen10_E.wav']);
L=length(y)/512;
for i=1:L
    y1=y(1+(i-1)*512:i*512).*hamming(512);
%y1=y(1:1024).*hamming(1024);
t=(1/fs:1/fs:length(y1)/fs)*1000;
subplot(221);plot(t,y1);axis tight;
x=fft(y1);
for i=1:length(x)-1;
    if x(i,1)==0
    x(i,1)=x(i+1,1);
    end
end
a=2*log2(abs(x));
%a=fftshift(a);%平移频率谱。
%f=((1:(length(a)/2))/fs)*1000;
subplot(222);
%plot(f,a(1:length(a)/2));axis tight;
plot(a(1:length(a)/2));
b=ifft(a);
t=(1/fs:1/fs:length(b)/2/fs)*1000;  % ms
subplot(223);plot(t,b(1:length(b)/2));axis tight;
%subplot(224);plot(abs(b));axis tight;
axis tight;
%怎么用升余弦窗？？？
t=1:size(b)/8;
xy=(1+cos(2*pi*(t-100)/100))/2;
%b2=b(1:length(t)).*xy';
%plot(b);
%figure;plot(b2);axis tight;
pause
clc;
end
toc,


%滤波
clc;clear;%若不clear可能会出不来图像
[k2,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
[k,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen8_E.wav']);

y1=bendb(k,Fs,300,800,3);
y2=bendb(k,Fs,100,200,20);
y3=bendb(y2,Fs,1000,1300,3);
%sound(y3,Fs);
x=k-y2(1:length(k));
sound(x,Fs);
[k,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'qimiao1.wav']);
%左右声道相减
[k,Fs]=wavread(['D:\FFOutput\' 'hao.wav']);
for i=1:1:2
 y=k(:,i);
 y1=high(y,Fs,70,3);
 y2=bendb(y1,Fs,100,500,10);
 x(:,i)=y-y2(1:length(y));
end
 xx=x(:,1)-x(:,2);
sound(xx,Fs);
%再分离
y1=high(k,Fs,70,3);
y2=bendb(y1,Fs,100,500,10);
x=k-y2(1:length(k));
sound(x,Fs);
filename='titon_2_07';
filename1='fen17';
SVS(x,Fs,1,filename1);

%另一首歌-我们都是好孩子
%消声
[k,Fs]=wavread(['D:\FFOutput\' 'hao.wav']);
k1=k(:,1);
k2=k(:,2);
kk=k1-k2;
wavwrite(kk,Fs,['E:\课设程序2\RPCA_separation_codes\codes\example\output\' '双通道消声.wav']);
sound(kk,Fs);
%调参
filename='titon_2_07';
filename1='fen17';
SVS(k1,Fs,1,filename1);
filename1='fen18';
SVS(k1,Fs,2,filename1);
filename1='fen19';
SVS(k1,Fs,1.8,filename1);
filename1='fen20';
SVS(k1,Fs,1.9,filename1);
filename1='fen20(g=2)';
SVS(k1,Fs,1.9,filename1);
%滤波
[x,Fs]=wavread(['E:\课设程序2\RPCA_separation_codes\codes\example\output\' 'fen20_E.wav']);
stft(x,128, 128, 0, 32000);
y1=high(x,Fs,3000,3);
z=x-y2(1:length(x));
y2=bendb(z,Fs,400,600,10);
y=bendb(x,Fs,200,2500,3);
z=x-y(1:length(x));
sound(z,Fs);
wavwrite(y1,Fs,['E:\课设程序2\RPCA_separation_codes\codes\example\output\' 'fen20_E(2000上).wav']);
wavwrite(z,Fs,['E:\课设程序2\RPCA_separation_codes\codes\example\output\' 'fen20_E(2000下).wav']);

%另一首歌-遇见（现场版 人声较大）
[k,Fs]=wavread(['D:\FFOutput\' 'yujian.wav']);
k1=k(:,1);
filename='titon_2_07';
filename1='fen21';
SVS(k1,Fs,1.5,1,filename1);
filename='titon_2_07';
filename1='fen22';
SVS(k1,Fs,1.3,1,filename1);
filename='titon_2_07';
filename1='fen23';
SVS(k1,Fs,1,1,filename1);
%检测插值的影响
figure;
s1=length(y1);
s2=length(y2);
t1=1:1:s1;
t2=1:1:s2;
plot(t1,y1,'r');
hold on
plot(t2,y2,'g');
legend('n=30','n=10');
X1 = fft(y1,s1); 
X2 = fft(y2,s2); 
Pyy1 = X1.* conj(X1) / s1; 
Pyy2 = X2.* conj(X2) / s2; 
h1=floor(s1/2); 
h2=floor(s2/2); 
f1=Fs*(0:h1)/s1; 
f2=Fs*(0:h2)/s2; 
figure;
plot(f1,Pyy1(1:h1+1),'r');xlabel('Frequency(Hz)'); 
hold on
plot(f2,Pyy2(1:h2+1),'g');xlabel('Frequency(Hz)'); 
legend('n=30','n=10');
%自己合成
[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x1=x(:,1);
y1=y(1:length(x),1); z=x1+y1; sound(z,Fs)
filename='titon_2_07';
filename1='虫fen1';
SVS(z,Fs,1,1,1,filename1);


filename1='虫fen2';
SVS(z,Fs,1.3,1,1,filename1);


filename1='虫fen3';
SVS(z,Fs,1.2,1,1,filename1);

filename1='虫fen4';
SVS(z,Fs,0.9,1,1,filename1);

[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音0.5.wav']);
x1=x(:,1);
y1=y(1:length(x),1); z=x1+y1; sound(z,Fs)
filename='titon_2_07';
filename1='虫fen5';
SVS(z,Fs,1,1,1,filename1);

[k,Fs]=wavread(['E:\课设程序2\RPCA_separation_codes\codes\example\output\' '虫fen1_A.wav']);
y1=high(k,Fs,2000,1);
x=k-y1(1:length(k));
sound(x,Fs);

[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x1=x(:,1);
y1=y(1:length(x),1); wavinmix=x1+y1;
[wavinE,Fs]=wavread(['D:\FFOutput\' '新录音0.5.wav']);
wavinE=wavinE(1:length(wavinmix),1);

stft(wavinE,128, 128, 0, 32000);%subplot(2,2,3);
[e1,e2,e3] = bss_decomp_gain( wavinmix', 1, wavinE');
[sdr_,sir_,sar_] = bss_crit( e1, e2, e3);

y=wavread(['D:\FFOutput\' '新录音.wav']);
x1=y(:,1);
stft(x1,128, 128, 0, 32000);




[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞吉他伴奏.wav']);
[filename, pathname] = uigetfile({'*.mp3;*.wav','All music Files';...
'*.*','All Files' });
snr=inputdlg('请输入信噪比');
snr= str2num(snr{1,1});
[Y,NOISE] = add_noisefile(x,[pathname,filename],snr,Fs);

[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x1=x(:,1);
y1=y(:,1);
n=min([length(x1) length(y1)]);
y1=y1(1:n); 
x1=x1(1:n); 
wavinmix=x1+y1;
[a,b,c,d]=SVS1(x1,y1,wavinmix,Fs,1,'虫儿飞');

[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
%小波去噪
y=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'fen11_E.wav']);
%用小波函数db6对信号进行三层分解
[c,l]=wavedec(y',3,'db6');
%估计尺度为1的噪声标准偏差
sigma=wnoisest(c,l,1);
alpha=2;
%获取消噪过程中的阈值
thr=wbmpen(c,l,sigma,alpha);
keepapp=1;
%对信号进行消噪
yd=wdencmp('gbl',c,l,'db6',3,thr,'s',keepapp);%去噪或者压缩

x=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_E.wav']);
y=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);
z=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\output\' 'titon_2_07_A.wav']);
[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x=x(:,1);
y=y(:,1);
stft(x,128, 128, 0, 32000);
N=min([length(x) length(y)]);
x=x(1:N);
y=y(1:N);
[yn,W,en]=LMS(x,y,10,1/(N+1));


[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x1=x(:,1);
y1=y(1:length(x),1); wavinmix=x1+y1;
SVS1(x1,y1,wavinmix,Fs,1,'虫儿飞1')
SVS1(x1,y1,wavinmix,Fs,0.8,'虫儿飞1')
SVS1(x1,y1,wavinmix,Fs,0.9,'虫儿飞12')
SVS1(x1,y1,wavinmix,Fs,1.1,'虫儿飞13')
SVS1(x1,y1,wavinmix,Fs,1.2,'虫儿飞14')
%SDR:3.204865 SIR:6.328167 SAR:7.014334 NSDR:1.128773
%SDR:3.096379SIR:4.270975SAR:10.729357NSDR:1.020287
%SDR:3.187683SIR:5.122151SAR:8.795577NSDR:1.111592
%SDR:3.138687SIR:7.838859SAR:5.596882NSDR:1.062595
%SDR:2.962212SIR:9.815747SAR:4.397035NSDR:0.886120
y=wavread(['D:\FFOutput\' '新录音0.5 - 铃声.wav']);
x1=x(:,1);
y1=y(1:length(x),1); wavinmix=x1+y1;
SVS1(x1,y1,wavinmix,Fs,1,'虫儿飞')
SVS1(x1,y1,wavinmix,Fs,0.8,'虫儿飞')
SVS1(x1,y1,wavinmix,Fs,0.9,'虫儿飞')
SVS1(x1,y1,wavinmix,Fs,1.1,'虫儿飞')
SVS1(x1,y1,wavinmix,Fs,1.2,'虫儿飞')
%SDR:-3.193217 SIR:-1.094488 SAR:4.564181 NSDR:0.839266
SDR:-3.452626SIR:-2.541727SAR:8.242522NSDR:0.57985
SDR:-3.337473SIR:-1.938410SAR:6.349532NSDR:0.695010
SDR:-3.016487SIR:-0.001364SAR:2.999978NSDR:1.015996
SDR:-2.813484SIR:1.572728SAR:1.448277NSDR:1.218999
y=wavread(['D:\FFOutput\' '新录音1.5 - 铃声.wav']);
x1=x(:,1);
y1=y(1:length(x),1); wavinmix=x1+y1;
a=SVS1(x1,y1,wavinmix,Fs,0.8,'虫儿飞a');
b=SVS1(x1,y1,wavinmix,Fs,0.9,'虫儿飞b');
c=SVS1(x1,y1,wavinmix,Fs,1,'虫儿飞c');
d=SVS1(x1,y1,wavinmix,Fs,1.1,'虫儿飞d');
e=SVS1(x1,y1,wavinmix,Fs,1.2,'虫儿飞e');
SDR:6.714340SIR:8.136698SAR:12.874351NSDR:1.156901
SDR:6.745800SIR:9.146807SAR:10.963843NSDR:1.188360
%SDR:6.347057 SIR:10.546846 SAR:8.791560 NSDR:0.789617
SDR:5.629866SIR:12.295187SAR:6.932746NSDR:0.07242
SDR:4.917678SIR:14.300963SAR:5.607908NSDR:-0.639762
y=wavread(['D:\FFOutput\' '新录音2 - 铃声.wav']);
x1=x(:,1);
y1=y(1:length(x),1); wavinmix=x1+y1;
SVS1(x1,y1,wavinmix,Fs,1,'虫儿飞')
%SDR:8.307153 SIR:13.562099 SAR:10.032157 NSDR:0.273519

y1=[3.09 4.27 10.73 1.02; 3.19 5.12 8.80 1.11;3.20 6.33 7.014 1.13; 3.14 7.89 5.60 1.06;2.96 9.82 4.40 0.89];
y2=[ -3.45 -2.54 8.24 0.57;-3.33 -1.94 6.35 0.70;-3.19 -1.09 4.56 0.84; -3.02 0 2.3 1.016;-2.8 1.573 1.45 1.22];
y3=[6.714340 8.136698 12.874351 1.156901;6.745800 9.146807 10.963843 1.188360;6.347057 10.546846 8.791560 0.789617;5.629866 12.295187 6.932746 0.07242;4.917678 14.300963 5.607908 -0.639762];
x1=[3.09 4.27 10.73 ; 3.19 5.12 8.80 ;3.20 6.33 7.014 ; 3.14 7.89 5.60 ;2.96 9.82 4.40];
x2=[ -3.45 -2.54 8.24 ;-3.33 -1.94 6.35 ;-3.19 -1.09 4.56 ; -3.02 0 2.3 ;-2.8 1.573 1.45 ];
x3=[6.714340 8.136698 12.874351 ;6.745800 9.146807 10.963843 ;6.347057 10.546846 8.791560 ;5.629866 12.295187 6.932746;4.917678 14.300963 5.607908 ];

b=bar(x3);
grid on;
ch = get(b,'children');
set(gca,'XTickLabel',{'0.8','0.9','1','1.1','1.2'})
%set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
legend('SDR','SIR','SAR');
xlabel('lambda');
ylabel('dB');
title('人声：伴奏声=1.5：1')


[y,Fs]=wavread(['D:\FFOutput\' '虫儿飞录音 - 铃声.wav']);
[x,fs]=wavread(['D:\FFOutput\' '虫儿飞吉他独奏 - 铃声.wav']);

[x,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
y=wavread(['D:\FFOutput\' '新录音.wav']);
x=x(:,1);
y=y(:,1);
N=min([length(x) length(y)]);
x=x(1:N/2);
y=y(1:N/2);
wavinmix=x+y;
SVS1(x,y,wavinmix,Fs,0.2,'虫儿飞')
SVS1(x,y,wavinmix,Fs,0.5,'虫儿飞')
SVS1(x,y,wavinmix,Fs,0.8,'虫儿飞')
SVS1(x,y,wavinmix,Fs,1,'虫儿飞')
SVS1(x,y,wavinmix,Fs,1.2,'虫儿飞')
SVS1(x,y,wavinmix,Fs,1.5,'虫儿飞')
SVS1(x,y,wavinmix,Fs,2,'虫儿飞')
SDR:1.092887SIR:1.124646SAR:24.952188

SDR:1.449369SIR:1.765571SAR:15.201327

SDR:1.746169SIR:2.817254SAR:10.176533

SDR:1.970409SIR:4.523481SAR:6.804458

SDR:1.930775SIR:7.776354SAR:3.910310

SDR:0.104803SIR:14.238949SAR:0.436393

SDR:-4.992764SIR:20.109247SAR:-4.937183

z=[1.092887 1.124646 24.952188;1.449369 1.765571 15.201327;1.746169 2.817254 10.176533;1.970409 4.523481 6.804458;1.930775 7.776354 3.910310;0.104803 14.238949 0.436393;-4.992764 20.109247 -4.937183];


y4=[-6.925719 -6.390941 9.723496 -0.356670;-7.048544 -6.181048 7.491683 -0.479495;-7.058177 -5.739019 5.525511 -0.489128;-7.016304 -4.925490 3.298752 -0.447255;-6.817828 -3.555876 1.097043 -0.248779];
y1=[3.09 4.27 10.73 1.02; 3.19 5.12 8.80 1.11;3.20 6.33 7.014 1.13; 3.14 7.89 5.60 1.06;2.96 9.82 4.40 0.89];
b=bar(z);
grid on;
ch = get(b,'children');
set(gca,'XTickLabel',{'0.2','0.5','0.8','1','1.2','1.5','2'})
%set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
legend('SDR','SIR','SAR');
xlabel('lambda');
ylabel('dB');
title('参数lambda对分离效果的影响')

[x,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_music.wav']);
[y,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_SNR5.wav']);
SVS1(x,y,z,Fs,0.8,'t')
SVS1(x,y,z,Fs,0.9,'t')
SVS1(x,y,z,Fs,1,'t')
SVS1(x,y,z,Fs,1.1,'t')
SVS1(x,y,z,Fs,1.2,'t')
SDR:0.943293SIR:2.586169SAR:7.867601NSDR:3.505510
SDR:3.315088SIR:6.770627SAR:6.750680NSDR:5.877306
SDR:6.325290SIR:12.744318SAR:7.674532NSDR:8.887508
SDR:8.917985SIR:19.382075SAR:9.376711NSDR:11.480203
SDR:9.152839SIR:20.922382SAR:9.486833NSDR:11.715057
y5=[0.943293 2.586169 7.867601 3.505510; 3.315088 6.770627 6.750680 5.877306;6.325290 12.744318 7.674532 8.887508;8.917985 19.382075 9.376711 11.480203;9.152839 20.922382 9.486833 11.715057];
b=bar(y5);
grid on;
ch = get(b,'children');
set(gca,'XTickLabel',{'0.8','0.9','1','1.1','1.2'})
%set(ch,'FaceVertexCData',[1 0 1;0 0 0;])
legend('SDR','SIR','SAR','NSDR');
xlabel('lambda');
ylabel('dB');
title('电子琴伴奏')


[x,fs]=wavread(['D:\FFOutput\' '虫儿飞吉他独奏 - 铃声.wav']);
[y,Fs]=wavread(['D:\FFOutput\' '虫儿飞伴奏.wav']);
subplot(2,1);stft(x, 2048, 2048, 0, 32000)
subplot(2,2);stft(x, 2048, 2048, 0, 32000)
[z,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_music.wav']);
z=z(:,1);


[z,Fs]=wavread(['E:\课设程序2\程序草稿\外文文献中资源\MIR-1K\LyricsWav\' 'ABJones_1_lyrics.wav']);
 t=1:1:s;
noise2=20*sin(2*pi*50*t);   %产生等长度的正余弦噪声信号(这里的噪声的大小取决于随机函数的幅度倍数）  
z=z+noise2';
% z=(1:n/20);
 s=length(z);
t=1/Fs:1/Fs:s/Fs;
subplot(2,1,1)
plot(t,z,'g');
grid on
xlabel('时间（s）')%x轴标记
ylabel('幅度')%y轴标记
title('时域图')%标题

X = fft(z,s); 
Pyy = X.* conj(X) / s; 
h=floor(s/2); 
f=Fs*(0:h)/s; 
subplot(2,1,2)
plot(f,Pyy(1:h+1));xlabel('频率(Hz)'); 
grid on
ylabel('幅度')%y轴标记
title('频域图')%标题

noise3 = awgn(z,5,'measured'); 
z=z+noise3;  


t=1:1:s;
noise2=0.5*cos(2*pi*50*t);   %产生等长度的正余弦噪声信号(这里的噪声的大小取决于随机函数的幅度倍数）  
z=z+noise2';

noise1=0.5*randn(s,1);  %产生等长度的随机噪声信号(这里的噪声的大小取决于随机函数的幅度倍数） 
noise1=noise1';
z=z+noise1;        %将两个信号

[x,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_music.wav']);
[y,Fs]=wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal.wav']);



sep = [x,y]';
orig = [x,y]';
for i = 1:size( sep, 1)
       [e1,e2,e3] = bss_decomp_gain( sep(i,:), i, orig);
       [sdr(i),sir(i),sar(i)] = bss_crit( e1, e2, e3);
end
SDR=sdr(2);
SIR=sir(2);
SAR=sar(2);
