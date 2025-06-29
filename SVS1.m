function [SDR,SIR,SAR,NSDR] = SVS1(wavinA,wavinE,wavinmix,Fs,lambda,filename1)
%���ܣ�������������ۣ����������FsΪҪ��������Ĳ���Ƶ��,lambdaΪ���Σ�һ��ȡ0.8-1.2֮����ʺϣ�filename1Ϊ�����������Ͱ������ı����ַ��
%wavinAΪԭʼ����������������wavinEΪԭʼ��������������ZΪҪ����ĸ�����������
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%stft(wavinE,128, 128, 0, 32000);%subplot(2,2,3);
[e1,e2,e3] = bss_decomp_gain( wavinmix', 1, wavinE');
[sdr_,sir_,sar_] = bss_crit( e1, e2, e3);
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
%% NSDR=SDR(estimated voice, voice)-SDR(mixture, voice)
NSDR=Parms.SDR-sdr_;     
SDR=Parms.SDR;
SIR=Parms.SIR;
SAR=Parms.SAR;
%%                               
fprintf('SDR:%f\nSIR:%f\nSAR:%f\nNSDR:%f\n',Parms.SDR,Parms.SIR,Parms.SAR,NSDR);
end


