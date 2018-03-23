function [PhDiff] = phaseDiff(input,output,period,time)
a=floor(length(time)/2);
b=length(time);
interval=time(a:b);

plot(time,output(1:length(time)),'g')
% preparation of the time vector
% N = round(T*fs);
% t = (0:N-1)/fs;

% generation of the signal
% x = sin(2*pi*f0*t) + 0.02*randn(1, N);
% y = 0.5*sign(sin(2*pi*f0*t - pi/6)) + 0.02*randn(1, N);

% phase difference calculation
in=input(a:b);
out=output(a:b);
PhDiff = phdiffmeasure(in,out);
PhDiff = PhDiff*180/pi;

% display the phase difference
%PhDiffstr = num2str(PhDiff);
%disp(['Phase difference Y->X = ' PhDiffstr ' deg'])

%plot the signals
% subplot(2,1,1)
% plot(interval, in, 'b', 'LineWidth', 2)
% grid on
% hold on
% subplot(2,1,2)
% plot(interval, out, 'r', 'LineWidth', 2)
% set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
% xlabel('Time, s')
% ylabel('Amplitude, V')
% title('Two signals with phase difference')
% legend('First signal', 'Second signal')

end