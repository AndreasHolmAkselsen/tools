function AHA_moveTexFigs(inputTex,outputTex,figureOutputPath,REMOVE_COMMENT_LINES,additionalExtensions)
% function AHA_moveTexFigs(inputTex,outputTex,figureOutputPath,REMOVE_COMMENT_LINES,additionalExtensions)
% creates a new .tex file with figure path content replaced to a new figure folder with updated figure names.
% The figure files corresponding to the path in every call to '\includegraphics' are copied to that folder and renamed accordingly.
% 
% inputTex: full path of input .tex file. Is write protected. 
% outputTex: (full?) output .tex file.
% figureOutputPath: (full?) path of folder in which to place extracted figures. (Default: a folder /figures/ in the output directory.)
% REMOVE_COMMENT_LINES: bool. Excludes all linea beginning with '%' from the output .tex file. (Default: false.)
% additionalExtensions: Cell array of string, i.g. {'.png'}. Copies also every found figure with the provided extension to the figure folder, in 
%                                                            addition to the those specified in the input .tex. (Default: {}.)
%
% AHA, 2019, updated nov.2023.

if nargin<=2 || isempty(figureOutputPath), figureOutputPath = [fileparts(outputTex),filesep,'figures',filesep]; end
if nargin<=3, REMOVE_COMMENT_LINES = false; end
if nargin<=4, additionalExtensions = {}; end

% % script for findinf the figure path on, collecting the figures in a folder "filedir" and editing the .tex thereafter.
% clear
% inputTex = 'C:/analysis/302006068_WaveLoads/waveloadsFloor_SMBredo/memo_SMBFloorForves_update/memo_AHA_SMBFloorForces_update_nov2023.tex'; % full path!
% outputTex = './memo_AHA_SMBFloorForces_update_nov2023_local1.tex';
% figureOutputPath = './figures'; % folder to which figures are copied.
% additionalExtensions = {'.png'};
% REMOVE_COMMENT_LINES = true;
%%  code
inputTex(inputTex=='\') = filesep;
outputTex(outputTex=='\') = filesep;
figureOutputPath(figureOutputPath=='\') = filesep;
assert(~strcmp(inputTex,outputTex),'Equal import and export paths. For file safety, do not overwrite original.')

outPath = fileparts(outputTex); if ~isfolder(outPath), mkdir(outPath); end
if ~isfolder(figureOutputPath), mkdir(figureOutputPath); end

fidIn = fopen(inputTex,'r'); 
fidOut = fopen(outputTex,'w');
assert(fidIn>0,'Could not find or open input file ''%s''',inputTex); 
assert(fidOut>0,'Could not open output file ''%s''',outputTex); 
pathsRelativeTo = fileparts(inputTex);

% assert(fid~=fidw)
count=0;
tline = fgets(fidIn);

while ischar(tline)
    stripLine = strip(tline);
    isCommentLine = ~isempty(stripLine) && stripLine(1)=='%';
    k0 = strfind(tline,'\includegraphics[');
    size123 = 1:length(tline);
    if ~isCommentLine && ~isempty(k0)
        count = count + 1;
        k1 = find( tline == '{' & k0 < size123 ,1,'first'  )+1;
        k2 = find( tline == '}' & k1 < size123 ,1,'first'  )-1;
        oldPath = tline(k1:k2);
        if oldPath(1) == '.', oldPath=[pathsRelativeTo,filesep,oldPath]; end
        newpath = sprintf('%s/fig_%0.2d%s',figureOutputPath,count,strip(oldPath(end-3:end)));
        copyfile(oldPath,newpath);
        tline = [tline(1:k1-1),newpath,tline(k2+1:end)];
        for i = 1:length(additionalExtensions)
            [a,b] = fileparts(oldPath); 
            additionalFile = [a,filesep,b,additionalExtensions{i}];
            if isfile(additionalFile)
                [a,b] = fileparts(newpath);
                copyfile(additionalFile,[a,filesep,b,additionalExtensions{i}]);
            end
        end
    end

    if ~REMOVE_COMMENT_LINES || ~isCommentLine
        fprintf(fidOut,'%s',tline);
    end
    tline = fgets(fidIn);
end

fclose(fidOut);
fclose(fidIn);