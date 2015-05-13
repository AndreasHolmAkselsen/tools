function [p,T] = simple_fft(signal,dt,n__N)

assert(nargin>1);
if nargin == 2, n__N = 2; end


ls = length(signal);
Fs = 1/dt;
N = floor(ls/n__N);


y = fft(signal-mean(signal),N);
p = abs(y(floor(1:N/2)));
f=(Fs/N.*(0:(N/2)-1))';
T = 1./f;

% figure
% signal = data{3}.Meters(:,4)-mean(data{3}.Meters(:,4));
% ls = length(signal);
% ts = data{3}.Meters(ls,1)/ls;
% Fs = 1/ts;
% N = floor(ls/2);
% 
% 
% y = fft(signal,N);
% p = abs(y)/ls;
% f=Fs/N.*(0:(N/2)-1);
% T = 1./f;
% stem(T,p(floor(1:N/2)));