
function PhDiff = phdiffmeasure(x, y)

% function: PhDiff = phdiffmeasure(x, y)
% x - first signal in the time domain
% y - second signal in the time domain
% PhDiff - phase difference Y -> X, rad

% represent x as column-vector if it is not
if size(x, 2) > 1
    x = x';
end

% represent y as column-vector if it is not
if size(y, 2) > 1
    y = y';
end

% remove the DC component
x = x - mean(x);
y = y - mean(y);

% signals length
N = length(x);

% window preparation
win = rectwin(N);

% fft of the first signal
X = fft(x.*win);
% fft of the second signal
Y = fft(y.*win);

% %plots
% figure(1)
% plot(abs(X),'r')
% hold on
% plot(angle(X),'g')



% phase difference calculation
[~, indx] = max(abs(X));
[~, indy] = max(abs(Y));
PhDiff = angle(Y(indy)) - angle(X(indx));

end