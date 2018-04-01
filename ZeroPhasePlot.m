function [nophase] = ZeroPhaseFilter(A)
windowSize = 400; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
smallest_out=min([length(A.output.signal) length(A.output.time)]);
smallest_in=min([length(A.input.signal) length(A.input.time)]);
time=A.output.time(1:smallest_out);
input=A.input.signal(1:smallest_in);
output=A.output.signal(1:smallest_out);
rng default;
d = designfilt('lowpassfir', ...
    'PassbandFrequency',0.15,'StopbandFrequency',0.2, ...
    'PassbandRipple',1,'StopbandAttenuation',60, ...
    'DesignMethod','equiripple');
nophase = filtfilt(d,output);

% subplot(2,1,2);
% plot(time,nophase);
% title('Filtered Waveforms');
% xlabel('time')
% ylabel('amplitude')
% legend('no-phase filter');
% 
% subplot(2,1,1);
% plot(time,output);
% xlabel('time')
% ylabel('amplitude')
% title('Original Waveform');
end