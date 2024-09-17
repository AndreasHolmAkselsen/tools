function s = makeStruct(varargin)
% s = makeStruct(var1,var2,...)
%   returns a struct with fieldnames var1,var2, etc.
% AHA, aug. 2024
    names = cell(1,nargin);
    for i = 1:nargin
        names{i} = inputname(i);
    end
    args = [names;varargin];
    s = struct(args{:});
end