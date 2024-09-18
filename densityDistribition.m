function field = densityDistribition(x,y,xp,yp,varargin)
% field = densityDistribition(x,y,xp,yp)
% field = densityDistribition(___,optionName,optionValue)
%   provides a 2D field of points spaning [x,y] with each point [xp,yp] marked with some element function holding a certain point width.@
%   Field is normalized to 1 such that the peak value of all points overlapping equals one.
%
% Optional argument pairs
% pointWidth:   scalar or [wx,wy]. Width of points in dimension x and y. Default: 1/25*domain range in x and y.
% distribution: 'circle' or 'gauss'. Flag determening element function. Default: 'circle.
%
% AHA, Sep. 2024.

assert(all(size(xp)==size(yp)),'xp and yp must be of the same size.');
opt.pointWidth = 1/25; % base on point range
opt.distribution = 'circle'; % 'circle' or 'gauss'
% set flagged input options
for i = 1:2:length(varargin)
    assert(isstring(varargin{i})||ischar(varargin{i}),'Optional inputs in the form of name--value pairs.')
    assert(isfield(opt,varargin{i}),'Option ''%s'' not recognised. Valid options are %s.',varargin{i},sprintf('''%s'',',string(fieldnames(opt))));
    opt.(varargin{i}) = varargin{i+1};
end

% set point radius R
if numel(opt.pointWidth) == 1
    rx = (max(x(:))-min(x(:)))*opt.pointWidth/2;
    ry = (max(y(:))-min(y(:)))*opt.pointWidth/2;
else
    rx = opt.pointWidth(1)/2;
    ry = opt.pointWidth(2)/2;
end

field = 0;
np = length(xp);
switch opt.distribution
    case 'circle'
        for i = 1:np
            field = field + (((x-xp(i))/rx).^2+((y-yp(i))/ry).^2 < 1);
        end
    case 'gauss'
        for i = 1:np
            field = field + exp(-.5*(((x-xp(i))/rx).^2+((y-yp(i))/ry).^2));
        end
end
field = field/np;