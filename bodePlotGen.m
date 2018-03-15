function [ ] = bodePlotGen(minExp,maxExp,step)
close all
syms t
windowSize = 300; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
l=(maxExp+minExp+1);
p=(step-1)*(maxExp+minExp);
sz=l+p;
Gain=zeros(1,sz);
Phase=zeros(1,sz);
funs=zeros(1,sz,'sym');
freq=zeros(1,sz);
phase_avg=2;
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
    figure('units','normalized','outerposition',[0 0 1 1])
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
%     outputFiltered=filter(b,a,output);
    outputFiltered=ZeroPhasePlot(data)
    n = length(outputFiltered);
    fs=n/30;%samples/second
    %[pks,locs] = findpeaks(outputFiltered,outtime)
    c = (-1 * fs) / 2:fs / n:fs / 2 - fs / n; 
    zciOut = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0);                 % Returns Zero-Crossing Indices Of Argument Vector
    zxOut = zciOut(outputFiltered);
    zciIn = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0);                    % Returns Zero-Crossing Indices Of Argument Vector
    zxIn = zciIn(input);
    period=2*pi/(freq(i));
    cluster=period/15;
    temp=[];
    %remove clustering points from in-zeros
%     for j=1:length(zxIn)
%         for k=1:length(temp)
%             if abs(intime(zxIn(j))-intime(temp(k)))>cluster
%                 temp=[temp,zxIn(j)];
%                 break
%             end
%         end
%     end
%    zxIn=temp;
%    temp=[];
    %remove clustering points from out-zeros
    
    
%     figure
%     subplot(2,1,1)
%     plot(outtime,outputFiltered,'r');
%     hold on
%     plot(outtime(zxOut), outputFiltered(zxOut), 'bp');
%     
    flag=0;
    disp(length(outtime(zxOut)))
    for j=1:length(zxOut)
        flag=0;
        for k=1:length(temp)
            if abs(outtime(zxOut(j))-outtime(temp(k)))<cluster
                flag=1;
            end
        end
        if flag==0
            temp=[temp,zxOut(j)];
        end
    end
    zxOut=temp;
    disp(length(outtime(zxOut)))
    temp=[];
    

    %remove first few zeros (after 1 period or so) from both in and out
    for j=1:length(zxIn)-1
        if(intime(zxIn(j))>period)
            temp=[temp,zxIn(j)];
        end
    end
    zxIn=temp;
    temp=[];
    for j=1:length(zxOut)-2
        if(outtime(zxOut(j))>period)
            temp=[temp,zxOut(j)];   
        end
    end
    zxOut=temp;
%     length(zxOut)
%     length(zxIn)
%     
%         subplot(2,1,2)
%     plot(outtime,outputFiltered,'r');
%     hold on
%     plot(outtime(zxOut), outputFiltered(zxOut), 'bp');
%     
%     
    
    %make arrays the same size
    smallest=min([length(zxIn) length(zxOut)]);
    if smallest~=0
    zxIn=zxIn(1:smallest);
    zxOut=zxOut(1:smallest);

    %calculate average phase using zero-time-difference algorithm
    phase=0;
    if smallest>=phase_avg
        for j=1:phase_avg
            phase=phase+180*freq(i)*(zxOut(j)-zxIn(j))/pi;
        end
        %map phase angle between -180 and 180 degrees
        Phase(i)=phase/3;
        if Phase(i)>180
            Phase(i)=mod(Phase(i),180);
        end
        if Phase(i)<-180
            Phase(i)=mod(Phase(i),-180);
        end
    end
    %find Gain
    Gain(i)=20*log(abs(max(outputFiltered)));
    
    %plots
    subplot(sz,2,2*(i-1)+1);
    plot(intime,input,'r')
    xlabel(char(funs(i)));
    hold on
    plot(intime(zxIn), input(zxIn), 'bp')
    
    subplot(sz,2,2*(i-1)+2);
    plot(outtime,outputFiltered,'r');
    hold on
    %plot(locs,pks,'*g')
    %hold on
    plot(outtime(zxOut), outputFiltered(zxOut), 'bp');
    end
end

%bode plots
figure
ax1=subplot(2,1,1);
semilogx(freq,Gain,'r');
ylabel(ax1,'Gain (dB)');
ax2=subplot(2,1,2);
semilogx(freq,Phase,'b');
ylabel(ax2,'Phase (degrees)')
end