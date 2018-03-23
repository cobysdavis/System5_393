k=188
t=1/0.36
close all
num0=[k]
dem0=[1]
G0=tf(num0,dem0)
subplot(3,2,1)
bode(G0),grid
legend('k')

num1=[1]
dem1=[1,0]
G1=tf(num1,dem1)
subplot(3,2,2)
bode(G1),grid
legend('1/s')

num2=[1]
dem2=[1,t]
G2=tf(num2,dem2)
subplot(3,2,3)
bode(G2),grid
legend('1/(t+s)')


num2=[1,0,0]
dem2=[1]
G3=tf(num2,dem2)
subplot(3,2,4)
bode(G3),grid
legend('s')


numf=[k]
denf=[1,t,0]

G=tf(numf,denf)
subplot(3,2,5)
bode(G),grid
legend('k/(ts+s^2)')



