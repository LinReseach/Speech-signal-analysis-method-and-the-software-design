function [ ] = SVS(Z,Fs,lambda,filename1)
%�������룬����ZΪҪ����ĸ�������������FsΪҪ��������Ĳ���Ƶ��,lambdaΪ���Σ�һ��ȡ0.8-1.2֮����ʺϣ�filename1Ϊ�����������Ͱ������ı����ַ��
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
filename='titon_2_07';
%filename1='fen';
%filename2='fen2';
x=wavread(['D:\FFOutput\' 'mo.wav']);
y=wavread(['D:\FFOutput\' 'lei.wav']);
x1=x(:,1);y1=y(:,1);
wavinA=x1;
wavinE=y1;
%wavinA= wavread([filename,'_music1.wav'],[2200001  3600000]);
%wavinE= wavread(['E:\�������\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal1.wav'],[2200001  3600000]);
wavinmix=Z;
%stft(wavinE,128, 128, 0, 32000);%subplot(2,2,3);
%parm.outname=['example' filesep 'output' filesep filename1];
parm.outname=filename1;
parm.lambda=lambda;
parm.nFFT=1024;
parm.windowsize=1024;
parm.masktype=1; %1: binary mask, 2: no mask
parm.gain=1;
parm.power=1;
parm.fs=Fs;

Parms=rpca_mask_fun(wavinA,wavinE,wavinmix,parm); % SDR(\hat(v),v),  

end

