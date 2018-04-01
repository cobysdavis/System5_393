close all
data=load('good_step.mat');
intime=good_step.input.time;
input=good_step.input.signal;
outtime=good_step.output.time;
output=good_step.output.signal;
outputFiltered=ZeroPhasePlot(good_step);
figure
subplot(2,2,1)
plot(outtime,output,'r')
subplot(2,2,2)
plot(outtime,outputFiltered,'b')
windowSize = 300; 	
b = (1/windowSize)*ones(1,windowSize);	
a = 1;
outputFilteredMean=filter(b,a,output);	
subplot(2,2,3)
plot(outtime,outputFilteredMean,'g')
S = stepinfo(outputFilteredMean,outtime,1,'SettlingTimeThreshold',0.05)