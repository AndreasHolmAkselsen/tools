function x = checkReal(x,tolerance)
% x = checkReal(x,[tolerance])
% checks whether input is real relative to each component according to tolerance (defalult 1e-12). 
% If yes, it returns pure real part of input. If no, it displays an error message indicating 
% the magnitude of largest imaginary component.
%
% AHA, Sep 2024.

if nargin < 2, tolerance = 1e-12; end
isOK = all(abs(imag(x)) < tolerance*abs(x)+1e-12);
if ~isOK
    maxIm = max(abs(imag(x(:))));
    maxAbs = max(abs(x(:)));
    maxRel = max(abs(imag(x(:))./abs(x(:))));
    varName = inputname(1); 
    if ~isempty(varName)
        varStr = [' ''',varName,''''];
    else
        varStr = '';
    end
    fprintf('Complex variabel%s at tolerance %g: max imag: %.3g, max abs: %.3g, max rel imag: %.3g.\n',varStr,tolerance,maxIm,maxAbs,maxRel);
    error('Variable%s is not real.',varStr);
end
x = real(x);