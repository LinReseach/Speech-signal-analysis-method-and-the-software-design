function [ ] = SVS(Z,Fs,lambda,filename1)
%歌声分离，其中Z为要分离的歌曲（向量），Fs为要分离歌曲的采样频率,lambda为超参，一般取0.8-1.2之间较适合，filename1为分离后的人声和伴奏声的保存地址。
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
%wavinE= wavread(['E:\课设程序\RPCA_separation_codes\codes\example\' 'titon_2_07_vocal1.wav'],[2200001  3600000]);
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

