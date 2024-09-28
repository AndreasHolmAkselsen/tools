function x = sqifft(hx2,nx)
%
% computes double sum 
%   x = sum_{n=-0}^{N-1} sum_{m=-0}^{N-1}  hx2.*exp(2i*pi*( n+m))/M
% where M = 2*N-1.
%
% Input:
%   hx2: NxN matrix of complex Fourier amplitudes, zero-frequencies at first indiex of each dimension.
%   nx (optional): scalar number of output points (resolution). Default: nx = 2*N-1, which is the lowest 
%                  resolution maintaining all information. if nx < 2*N-1 then nx should be odd. 
%
% for example
%   x = sum( fft(f).*fft(g.').*exp(1i*(wf+wg)*t), [1,2])
% where
%   dt = 1/(df*M) < 1/(df*N) and t = (0:M-1)*dt.
%
% assuming hx2 is *not* already centered, e.g. hx2 = fft(f).*fft(g.')
%
% AHA, Sep 2024


assert(ismatrix(hx2),diff(size(hx2))==0,'Input matrix must be square.');
hxDiag = ifftshift(sumAntiDiag(fftshift(hx2)));
% x = checkReal( ifftp(hxDiag,nx) );
x = ifftp(hxDiag,nx,'symmetric');
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







% [N,M] = size(hx2);
% assert(N==M,'Input matrix must be square.');
% hxDiag = ifftshift(sumAntiDiag(fftshift(hx2)));
% if nargin >= 2 % pad
%     nDiag = 2*N-1;
%     if nx < nDiag
%         warning('Trimming under-resolved signal. nx=%d, nDiag = %d.',nx,nDiag);
%         assert(mod(nx,2)==1,'under-resolved nx should be odd')
%         hxDiag = [hxDiag(1:(nx+1)/2);hxDiag(nDiag-(nx-3)/2:nDiag)];
%     else
%         hxDiag = [hxDiag(1:N);zeros(nx-nDiag,1);hxDiag(N+1:nDiag)];
%     end
%     assert(numel(hxDiag)==nx);
% end
% 
% x = checkReal( ifft(hxDiag) );
% % x = ifft(hxDiag,[],'symmetric');