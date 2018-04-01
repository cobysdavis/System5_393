function [ ] = bodePlotGen(minExp,maxExp,step)
close all
syms t
l=(maxExp+minExp+1);
p=(step-1)*(maxExp+minExp);
sz=l+p;
Gain=zeros(1,sz);
Phase=zeros(1,sz);
Phase2=zeros(1,sz);
funs=zeros(1,sz,'sym');
freq=zeros(1,sz);
for i=1:step:sz
    if i==1
        base=10^(i-1-minExp);
    else
        base=10^((i-1)/step-minExp);
    end
    plusbase=base*10;
    freq(i)=base;
for j=1:step-1
    freq(i+j)=j*(base+plusbase)/step;
end
end
freq=freq(1:sz);
for i=1:sz
    funs(i)=sin(freq(i)*t);
end
    %figure('units','normalized','outerposition',[0 0 1 1])
for i=1:sz
    data=load(strcat(num2char(i),'.mat'));
    data.input.time=data.(num2char(i)).input.time;
    data.input.signal=data.(num2char(i)).input.signal;
    data.output.time=data.(num2char(i)).output.time;
    data.output.signal=data.(num2char(i)).output.signal;
    intime=data.input.time;
    input=data.input.signal;
    outtime=data.output.time;
    output=data.output.signal;
    outputFiltered=ZeroPhasePlot(data);
    period=2*pi/(freq(i));


    smallestTime=min(length(intime), length(outtime));
    %find Gain
    in=input(1:smallestTime);
    out=outputFiltered(1:smallestTime);
    %Gain(i)=20*log10(abs(max(outputFiltered(floor(length(outputFiltered/2):length(outputFiltered))))));
    Gain(i)=20*log(abs(max(outputFiltered)));
    Phase(i)=phaseDiff(in,out,period,intime(1:smallestTime));
        
%     %plots
    subplot(sz,2,2*(i-1)+1);
    plot(intime,input,'r')
    xlabel(char(funs(i)));
    hold on
    subplot(sz,2,2*(i-1)+2);
    plot(outtime,outputFiltered,'b');
    hold on



end

%bode plots
figure(2)
ax1=subplot(2,1,1);
semilogx(freq,Gain,'r');
ylabel(ax1,'Gain (dB)');
ax2=subplot(2,1,2);
semilogx(freq,Phase,'b');
ylabel(ax2,'Phase (degrees)');
for i=1:length(Phase)
    Phase(i)=mapBW180(Phase(i));
end
disp(Phase)
end 