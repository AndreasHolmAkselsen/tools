addpath('.\S_riser_data\water');
addpath('.\S_riser_data\oil');

filename = {
%     'exp1_W'
%     'exp2_W'
%     'exp3_W'
%     'exp4_W'
%     'exp5_W'
%     'exp6_W'
%     'exp7_W'
%     'exp8_W'
%     'exp9_W'
%     'exp10_W'
%     'exp11_W'
%     'exp12_W'
%     'exp13_W'
%     'exp14_W'
%     'exp15_W'
%     'exp16_W'
%     'exp17_W'
%     'exp18_W'

%     'exp19_W'
%     'exp20_W'
%     'exp21_W'
%     'exp22_W'
%     'exp23_W'
%     'exp24_W'
%     'exp25_W'
%     'exp26_W'
%     'exp27_W'
%     'exp28_W'
%     'exp29_W'
%     'exp30_W'
%     'exp31_W'
%     'exp32_W'
%     'exp33_W'
%     'exp34_W'
%     'exp35_W'
%     'exp36_W'

%     'exp41_W'
%     'exp40_W'
%     'exp42_W'
%     'exp43_W'
%     'exp44_W'
%     'exp46_W'
%     'exp47_W'

    
        'O_exp2'
        'O_exp3'
        'O_exp4'
        'O_exp7'
        'O_exp11'
        'O_exp14'
        'O_exp17'

%         'O_exp19'
%         'O_exp24'
%         'O_exp30'
%         'O_exp35'

%     'O_exp41'
%     'O_exp40'
%     'O_exp42'
%     'O_exp43'
%     'O_exp44'
%     'O_exp46'
%     'O_exp47'

            }; % filename = flipud(filename);
        
load_data = true;
do_timeplot = false;
do_maxplot = false;
t_plot_var = 4; %variable index to plot



variables = {
    'Time'
    'U_g^S'
    'U_l^S'
    'p'
            };

l_id = length(filename);        
data = cell(l_id,1);


if load_data
    UgS = zeros(l_id,1);
    [M_air, M_liq,M_p] = deal(zeros(l_id,1));
    for id = 1:l_id
        data{id} = load(filename{id});
%         UgS(id) = data{id}.USG(2);
         UgS(id) = mean(data{id}.Meters(:,2));
         UlS(id) = mean(data{id}.Meters(:,3));
    end %id
%     [UgS,i_sort] = sort(UgS);
%     data = data(i_sort);
%     data_low = data(1:18);%data(UlS<0.33);
%     data_high = data(19:36);%data(UlS>=0.33);
%     clear data
end



if do_timeplot
    figure
    for id=1:l_id
        subplot(ceil(l_id/2),2,id);
        plot( data{id}.Meters(:,1), data{id}.Meters(:,t_plot_var) );
        ylabel(['U_g^S: ',num2str(UgS(id),2),'m/s']);
    end %id
end %do_timeplot

if do_maxplot
    [ind_peaks, peaks, ...
    ind_troughs, troughs] = deal(zeros(l_id,1) );
    for id=1:l_id
        [peaks(id),ind_peaks(id)] = max(data{id}.Meters(:,t_plot_var));
        [troughs(id),ind_troughs(id)] = min(data{id}.Meters(:,t_plot_var));
    end
    
    figure
    plot(UgS, peaks, '.--r',UgS, troughs,'.--b', 'linewidth', 5,'markersize',30);
end



