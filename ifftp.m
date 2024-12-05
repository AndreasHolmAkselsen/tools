function x = ifftp(hx,np,varargin)
% x = ifftp(hx,np)
% x = ifftp(hx,np,'symmetric')
% Inverse fft with padding/trimming such that size(x,1) = np.
% Supports both odd and even length input.
% Assumes zero-mode at first index.
%
% AHA, Spe. 2024.

siz = size(hx);
n = siz(1);
m = prod(siz(2:end));
if np > n
    if mod(n,2)==0
        hx = [hx(1:n/2,:);.5*hx(n/2+1,:);zeros(np-n-1,m);.5*hx(n/2+1,:);hx(n/2+2:n,:)];
    else
        hx = [hx(1:(n+1)/2,:);zeros(np-n,m);hx((n+1)/2+1:n,:)];
    end
elseif np < 0
    if mod(np,2)==0
        hx = [hx(1:np/2,:);hx(np/2+1,:)+hx(n-np/2+1,:);hx(n-np/2+2:n,:)]; 
    else
        hx = [hx(1:(np+1)/2,:);hx(n-(np+1)/2+2:n,:)]; 
    end
end
hx = reshape(hx,[np,siz(2:end)]);
x = ifft(hx,[],varargin{:});