% edit fig'ures stored as *' files.


paths = {
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_0177_double_res\images\water_fourier_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_0177_double_res\images\water_maxmin_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_0177_double_res\images\water_std_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_0177_double_res\images\water_time_trace_1_to_7_and_experiments_double_res_rescaled_30_01_2013'

'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_030_double_res\images\water_fourier_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_030_double_res\images\water_maxmin_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_030_double_res\images\water_std_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_030_double_res\images\water_time_trace_1_to_18_and_experiments_double_res_rescaled_30_01_2013'


'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_036_double_res\images\water_fourier_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_036_double_res\images\water_maxmin_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_036_double_res\images\water_std_1_to_18_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_WATER\S_riser_cases_USL_036_double_res\images\water_time_trace_1_to_18_and_experiments_double_res_rescaled_30_01_2013'


'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0177_double_res\images\oil_fourier_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0177_double_res\images\oil_maxmin_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0177_double_res\images\oil_std_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0177_double_res\images\oil_time_trace_1_to_7_and_experiments_double_res_rescaled_30_01_2013'


'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_030_double_res_longer\images\oil_fourier_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_030_double_res_longer\images\oil_maxmin_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_030_double_res_longer\images\oil_std_1_to_7_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_030_double_res_longer\images\oil_time_trace_1_to_7_and_experiments_double_res_rescaled_30_01_2013'


'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0358_double_res\images\oil_fourier_1_to_4_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0358_double_res\images\oil_maxmin_1_to_4_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0358_double_res\images\oil_std_1_to_4_and_experiments_double_res_rescaled_30_01_2013'
'C:\SLUGGIT_voidinslug\Plotit_2\Outputs\S_riser_cases_OIL\S_riser_cases_USL_0358_double_res\images\oil_time_trace_1_to_4_and_experiments_double_res_rescaled_30_01_2013'

};


% edit and restore figures
% addpath export_fig
% 
% for i = 1:length(paths)
%     hf = open([paths{i},'.fig']);
%     hgraphs = findobj(gca,'-property','markersize');
%     set(hgraphs,'markersize',20);
%     
%      export_fig(paths{i},'-pdf', '-eps', '-png','-bmp');
%     
%     close(hf);
%     clear hgraphs;
% end


% store data in *.mat files
for i = 1:length(paths)
    hf = open([paths{i},'.fig']);
    hgraphs = findobj(gca,'-property','Ydata');
    X = get(hgraphs,'XData');
    Y = get(hgraphs,'YData');
    
    save([paths{i},'.mat'],'X','Y')
    close(hf);
    clear hgraphs;
end
