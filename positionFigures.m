function hfs = positionFigures(varargin)
% Spreads figures out across screen.
% hfs = positionFigures(); 
% hfs = positionFigures(hfs,screenFrac,posArray,screenNumber,sortFigures);
% hfs = positionFigures(___,optionName,optionValue,...);
%
%   INPUT
%   hfs:          Figure handle array. Default: all available figures. 
%   OPTION NAMES  OPTION DESCRIPTION
%   screenFrac:   [fx,fy,fwx,fwy]. Fraction of screen in which to place figures. Values between 0 and 1. Default: [0,0,1,1].
%   posArray:     [ni,nj]. Number of figures in each direction. Default: square distribution.
%   screenNumber: Integer. Monitor number in case there are several. Default: 1.
%   sortFigures:  Boolean. Whether to sort figures after figure number. Default: true.
%   hideMenuBar:  Boolean. Sets figure property 'MenuBar' to 'none'. Default: false.
%   hideToolBar:  Boolean. Sets figure property 'ToolBar' to 'none'. Default: false.
%
% AHA, June 2024.

%% set input
% set defaults
opt.screenFrac = [0,0,1,1];
opt.posArray = [];
opt.screenNumber = 1;
opt.sortFigures = true;
opt.hideMenuBar = false;
opt.hideToolBar = false;

% collect available figure handles if not specified as input.
if nargin<1 || ~isa(varargin{1},'matlab.ui.Figure')
    hfs = findall(groot,'Type','figure');
else
    hfs = varargin{1};
    varargin(1) = [];
end
hfs(~isgraphics(hfs)) = []; % remove handles to deleted fuigures

% set flagged input options
for i = 1:2:length(varargin)
    assert(isfield(opt,varargin{i}),'Option ''%s'' not recognised.',varargin{i});
    opt.(varargin{i}) = varargin{i+1};
end

%% Adjust figures
screenFrac = opt.screenFrac;
posArray = opt.posArray;
if opt.sortFigures
    [~,ii] = sort([hfs.Number]); hfs = hfs(ii);
end

% set position array
n = numel(hfs);
if isempty(posArray)
    % square division
    nj = ceil(sqrt(n));
    ni = ceil(n/nj);
else
    ni = posArray(1);nj = posArray(2); 
    assert(nj*ni>=n,'Input position array to small to host all figures.')
end

if opt.hideMenuBar
    set(hfs,'MenuBar','none');
else
    screenFrac(4) = .96*screenFrac(4);
end
if opt.hideToolBar
    set(hfs,'ToolBar','none');
else
    screenFrac(4) = .96*screenFrac(4);
end

% position figures
monPos = get(0).MonitorPositions(opt.screenNumber,:);
figArea = [monPos(1:2)+screenFrac(1:2).*monPos(3:4) ,monPos(3:4).*screenFrac(3:4)];
wx = figArea(3)/nj; wy = figArea(4)/ni;
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


% if moveToUIFigures
%     for i = 1:length(hfs)
%         hfui = uifigure;
%         copyobj(hfs(i).Children,hfui);
%         hfs(i) = hfui;
%     end
% end