function [ ] = plotDiff(List)
A.output.signal;
B.output.signal;
sz=[size(A.output.signal) size(B.output.signal) size(C.output.signal)]
Q=[sz(:,1) sz(:,3) sz(:,5)]
smallest_size=min(Q)
Ainput=A.input.signal;
Binput=B.input.signal;
inputTime=A.input.time;
newTime=A.output.time(1:smallest_size);
newA=A.output.signal(1:smallest_size);
newB=B.output.signal(1:smallest_size);
super=newA+newB;
newC=C.output.signal(1:smallest_size);
X=newC-super;

figure
ax1 = subplot(3,1,1);
plot(newTime,super,'g',newTime,newC,'b',newTime,X,'r')
legend('system(A)+system(B)','system(A+B)','diff')
title(ax1,'Subplot 1')

ax2 = subplot(3,1,2);
plot(inputTime,Ainput,'g',inputTime,newA(1:2000),'b')
legend('input1','output1')
title(ax2,'Subplot 2')

ax3 = subplot(3,1,3);
plot(inputTime,Binput,'g',inputTime,newB(1:2000),'b')
legend('input2','output2')
title(ax3,'Subplot 3')
%plot(newTime,A.output.signal(1:smallest_size),'r',newTime,B.output.signal(1:smallest_size),'b')
end