function [ ] = checkLTI(A,B,C)
windowSize = 300; 
%a=sint
%b=cos4t
%super=7a+2b
b = (1/windowSize)*ones(1,windowSize);
a = 1;
smallest_size=min([length(A.output.signal) length(A.input.signal) length(B.output.signal) length(B.input.signal) length(C.output.signal) length(C.input.signal)]);
time=A.output.time(1:smallest_size);
% outB=filter(b,a,B.output.signal(1:smallest_size));
% outA=filter(b,a,A.output.signal(1:smallest_size));
% outC=filter(b,a,C.output.signal(1:smallest_size));
outA=A.output.signal(1:smallest_size);
outB=B.output.signal(1:smallest_size);
outC=C.output.signal(1:smallest_size);

outsuper=2*outA+4*outB;
subplot(2,1,1)
plot(time,outA,'r',time,outB,'b');
legend('T(sin(t))','T(cos(2t)');
subplot(2,1,2)
plot(time,outsuper,'r',time,outC,'b')
legend('2T(sin(t))+ 4T(cos(2t))','T(2sin(t)+4cos(2t))');
end