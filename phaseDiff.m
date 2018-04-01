function [PhDiff] = phaseDiff(input,output,period,time)
% a=floor(length(time)/2);
a=1;
b=length(time);
interval=time(a:b);

% phase difference calculation
in=input(a:b);
out=output(a:b);
PhDiff = phdiffmeasure(in,out);
PhDiff = PhDiff*180/pi;

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