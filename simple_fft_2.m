function [p,T] = simple_fft_2(time,signal,n__N)

% n : number of temporal points
% N : number of Fourier modes
% n__N: ratio n/N
% Fs: frequenct
% T : period

N_refine = 1;
N_repmat = 100;

assert(nargin>1);
if nargin == 2, n__N = 2; end


n = length(time);
assert(n > 1, 'input time must be a vector longer than one element.');
assert(all(time(2:end)-time(1:end-1)>0),'input time is not monotonically increasing.')

time_ip = linspace(time(1),time(n),n*N_refine);
signal_ip = interp1(time, signal, time_ip, 'cubic');
%repmatting
time_ip = linspace(time(1),time(n)*N_repmat,n*N_refine*N_repmat);
% signal_ip = repmat(signal_ip,1,N_repmat);
signal_ip = [signal_ip-mean(signal_ip), zeros(1,n*(N_repmat-1))];

dt = time_ip(2)-time_ip(1);


Fs = 1/dt;
N = floor(n*N_refine*N_repmat/n__N);


y = fft(signal_ip,N);
p = abs(y(1:floor(N/2)));
f=(Fs/N.*(0:(N/2)-1))';
T = 1./f;

