function varargout = dealm(y0)
    for i = length(y0):-1:1
        varargout{i} = y0(i);
    end
end