function hp = densityPlot(varargin)

if isa(varargin{1},'matlab.graphics.axis.Axes')
    ha = varargin{1};
    varargin(1) = [];
else
    ha = gca;
end
field = densityDistribition(varargin{:});
hp = mesh(ha,varargin{1},varargin{2},field);
