examp1=tf([1],[1 -4 3]);
[AMP PHA W]=bode(examp1);
gain = squeeze(AMP)
phase = squeeze(PHA)
w = squeeze(W)
subplot(2,1,1)
plot(w,gain)
subplot(2,1,2)
plot(w,phase)
response = gain.*exp(1i*phase*pi/180);
Ts = 0.1; % your sampling time 
gfr = idfrd(response,w,Ts);
Options = tfestOptions;                             
Options.Focus = 'prediction';   
tf1 = tfest(gfr, 2, 1, Options, 'Ts', 0.1);
P = bodeoptions;
P.PhaseWrapping = 'on';
bodeplot(examp1,tf1,P);