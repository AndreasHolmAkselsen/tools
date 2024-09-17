function unfoldStruct(s,varargin)
% unfoldStruct(s) 
% unfoldStruct(s,fieldname1, fieldname2,...) 
% loads fields of struct up into the workspace
%
% AHA, Sep. 2024
if nargin == 1
    fnames = fieldnames(s)';
else
    fnames = varargin;
end
for var = string(fnames)
    assignin("base",var,s.(var))
end
end