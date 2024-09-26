function x = sqifft(hx2)
%
% computes double sum 
%   x = sum_{n=-0}^{N-1} sum_{m=-0}^{N-1}  hx2.*exp(2i*pi*( n+m))/M
% where M = 2*N-1.
% for example
%   x = sum( fft(f).*fft(g.').*exp(1i*(wf+wg)*t), [1,2])
% where
%   dt = 1/(df*M) < 1/(df*N) and t = (0:M-1)*dt.
%
% assuming hx2 is *not* already centered, e.g. hx2 = fft(f).*fft(g.')
%
% AHA, Sep 2024


[N,M] = size(hx2);
assert(N==M,'Input matrix must be square.');

% x = checkReal( ifft(ifftshift(sumAntiDiag(fftshift(hx2))) ) );
x = ifft(ifftshift(sumAntiDiag(fftshift(hx2))),[],'symmetric');


end



function Asum = sumAntiDiag(A)
% sum anti-diagonal of square matrix.
    [N,M] = size(A);
    assert(N==M);
    Asum = zeros(2*N-1,1);
    for n = 1:N
        nn = n+(0:N-1);
        Asum(nn) = Asum(nn) + A(:,n);
    end
end