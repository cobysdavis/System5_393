function [ ] = checkLTI(A)
sz=[size(A.output.signal) size(A.input.signal)]
Q=[sz(:,1) sz(:,3)]
smallest_size=min(Q)
newTime=A.output.time(1:smallest_size);
sig=A.input.signal(1:smallest_size);
output=A.output.signal(1:smallest_size)
%output=movmean(output,700)
c = rdivide(sig,output)
%plot(newTime,super,'g',newTime,newC,'b',newTime,X,'r')
figure
plot(newTime,c)
end