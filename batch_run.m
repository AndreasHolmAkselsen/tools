% AHA, 26th of jan. 2013
% Script for creating input files and running simulations in parallel
% Usefull for batch simulations in case studies with varying flow rates.

%%%%%%%%%%%%%%%%%%%
%   Script inputs %
%%%%%%%%%%%%%%%%%%%

% safeguard
choice = menu('Are you sure you want to run batch simulation','Yes, damnit!','No, not reallly...');
if choice == 2, return; end

% close;

input_files = {
'ee02062'
% 'ee02070'
'ee02071'
% 'ee02072'
'ee02073'
% 'ee02074'
'ee02075'
% 'ee02076'
'ee02077'
% 'ee02078'
'ee02079'
 };

do_input_file_generation = true;
do_runsequnce = true;

% full directory of release executable
exe_dir = 'C:\SLUGGIT_New_Simplified_gitted\sluggitProject_momentum_interpolation\Release\sluggitProject.exe';
% batch directory
output_dir =  'C:\\SLUGGIT_New_Simplified\\PLOTIT\\outputs\\Olav\\Andreussi\\ee02062-ee02079\\';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create-input-file inputs %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ref_inputfile is the full directory of an imput file without sources
% specified
ref_inputfile = 'C:\SLUGGIT_New_Simplified\PLOTIT\outputs\Olav\Andreussi\ee02062-ee02079\input.h';
% Source input data in run order
USO = [
0.2
% 0.15
0.13
% 0.11
0.09
% 0.06
0.04
% 0.05
0.03
% 0.02
0.01

];

% dmdt_gas=[
% 
% ];
% 
% dmdt_liq=[
% 
% ];
% 
% zL_liq=0.10;
% zL_gas=0.10;
% temp_liq = 293;
% temp_gas = 293;
% press_liq=1.013e5;
% press_gas=1.013e5;


%%%%%%%%%%%%%
%   Script  %
%%%%%%%%%%%%%

l_id = length(input_files);
if do_input_file_generation
%     assert(l_id == length(dmdt_liq));
%     assert(l_id == length(dmdt_gas));
    assert(l_id == length(USO));
    ref_input = importdata(ref_inputfile);
    for id = 1:l_id
        
        
       % Code for mass sources:
%         % SOURCE:_zL=0.10,phase=gas,dmdt=3.53E-03,temp=293,u=0,press=1.013e5
%         % SOURCE:_zL=1.13,phase=oil,dmdt=5.88E-01,temp=293,u=0,press=1.013e5
%         liq_source_string = sprintf( 'SOURCE:_zL= %.4d, phase=oil, dmdt= %.4d, temp=%.4d, u=0, press= %.4d',...
%             zL_liq, dmdt_liq(id), temp_liq, press_liq);
%         gas_source_string = sprintf( 'SOURCE:_zL= %.4d, phase=gas, dmdt= %.4d, temp=%.4d, u=0, press= %.4d',...
%             zL_gas, dmdt_gas(id), temp_gas, press_gas);
%         new_input = [ ref_input; liq_source_string; gas_source_string ];

        % Code for USl BC
        USl_str = ['USO = ', num2str(USO(id))];
        new_input = [ ref_input; USl_str ];
        
        input_dir = [output_dir,input_files{id}];
        mkdir(input_dir);
        fid = fopen([input_dir,'\\input.h'],'wt');
        fprintf(fid,'%s\n', new_input{:});
        fclose(fid);
    end
end




if do_runsequnce
    for id = 1:l_id
        full_dir = [output_dir,input_files{id},'\\input.h'];
    %     eval(['!',exe_dir, ' ',full_dir ]);
    %   system([exe_dir, ' ',full_dir ]);
        dos([exe_dir, ' ',full_dir, ' &' ]);

    end
end