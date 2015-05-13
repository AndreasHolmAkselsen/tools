clear
N = 1;
nt = 10000;
time = linspace(0,10,nt);
dm = zeros(N,1);
ang_freq = dm;
eps = zeros(N,nt);
for i = 0:N-1
    dm(i+1) = rand()*2*pi;
    ang_freq(i+1) = 0.5*(2*i+1)*pi;
end

for i = 1:N
    eps(i,:) = cos(dm(i) + ang_freq(i)*time );   
end

 %plot(repmat(time, N,1)', eps')
plot(time', eps(1,:)',time',eps(end,:)')
% figure
% plot(time', sum(eps,1)')