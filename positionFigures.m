function hfs = positionFigures(hfs,screenFrac,posArray,screenNumber,sortFigures)
% Spreads figures out across screen.
% hfs = positionFigures(); 
% hfs = positionFigures(hfs,screenFrac,posArray,screenNumber,sortFigures);
%
%   INPUT
%   hfs:          Figure handle array. Default: all available figures. 
%   screenFrac:   [fx,fy,fwx,fwy]. Fraction of screen in which to place figures. Default: [1,1,1,1].
%   posArray:     [nx,ny]. Number of figures in each direction. Default: square distribution.
%   screenNumber: Integer. Monitor number in case there are several. Default: 1.
%   sortFigures:  Boolean. Whether to sort figures after figure number. Default: true.
%
% AHA, June 2024.


% set defaults
if nargin<1 || isempty(hfs)
    hfs = findall(groot,'Type','figure');
end
if nargin<2 || isempty(screenFrac)
    screenFrac = [0,0,1,1];
end
if nargin<3 || isempty(screenFrac)
    posArray = [];
end
if nargin<4 || isempty(screenNumber)
    screenNumber = 1;
end
if nargin<5 || isempty(sortFigures)
    sortFigures = true;
end

hfs(~isvalid(hfs)) = []; % remove handles to deleted fuigures
if sortFigures
    [~,ii] = sort([hfs.Number]); hfs = hfs(ii);
end

% set position array
n = numel(hfs);
if isempty(posArray)
    % square division
    nx = ceil(sqrt(n));
    ny = ceil(n/nx);
else
    nx = posArray(1); ny = posArray(2);
    assert(nx*ny>=n,'Input position array to small to host all figures.')
end

% position figures
monPos = get(0).MonitorPositions(screenNumber,:);
figArea = [monPos(1:2)+screenFrac(1:2).*monPos(3:4) ,monPos(3:4).*screenFrac(3:4)];
wx = figArea(3)/nx; wy = figArea(4)/ny;
x = figArea(1); y = figArea(2)+figArea(4)-wy; 
for i = 1:length(hfs)
    hfs(i).Position = [x,y,wx,wy];
    x = x+wx;
    if x>= figArea(1)+figArea(3)
        x = figArea(1);
        y = y-wy;
    end
    figure(hfs(i));
end