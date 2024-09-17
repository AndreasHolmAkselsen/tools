function ret = nonlinspace(a,b,n,squeezeNumber)
% ret = logspace2(a,b,n,compressionNumber)
% returns a log distribution from a to b of size 1xn.
% compressionNumber, e.g., 1e-3, governs how tight the row is squeezed to the left.
% 
% figure, hold on; for i = -3:1:3, a=2;b=5; plot(1:20,nonlinspace(a,b,20,i),'.');end
%
%   AHA, Sep. 2024

if squeezeNumber == 0
    ret = linspace(a,b,n);
    return
elseif squeezeNumber < 0 
    s10 = 10^squeezeNumber;
    ret = logspace(log10(s10),log10(abs(b-a)+s10),n)-s10+min(a,b);
elseif squeezeNumber > 0 
    s10 = 10^-squeezeNumber;
    ret =  - fliplr(logspace(log10(s10),log10(abs(b-a)+s10),n))+s10+max(a,b);
end
if a>b, ret = fliplr(ret); end
