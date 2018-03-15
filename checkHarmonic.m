function [ ] = checkHarmonic(A)
windowSize = 300; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
smallest_size=min([length(A.output.signal) length(A.input.signal)]);
time=A.output.time(1:smallest_size);
in=A.input.signal(1:smallest_size);
out=A.input.signal(1:smallest_size);
out=filter(b,a,out);
div = rdivide(out,in)
% for i=1:length(div)
%     if abs(div(i))>3
%         div(i)=0;
%     end
% end
avg=mean(div)
subplot(2,1,1)
plot(time,in,'g',time,out,'b')
legend('input','output')
xlabel('time')
ylabel('amplitude')
subplot(2,1,2)
plot(time,div)
xlabel('time')
ylabel('amplitude')
legend('output/input')
end