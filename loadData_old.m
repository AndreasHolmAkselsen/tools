function [ time, data ] = loadData( utplot_path, indices )
% function load_data( utplot_path )
%     global time data
    if nargin == 1
        indices = [2,9,3,6,7,10,19,24];
    end


    file_id = fopen(utplot_path,'r');
    assert(file_id ~= -1,['Data input file ',utplot_path, ' not found.' ] );
    tic
    A = cell2mat(textscan(file_id, repmat('%f32 ',1,25),'Delimiter',',', 'CollectOutput' ,true));
    toc
    if isempty(A)
        A = cell2mat(textscan(file_id, repmat('%f32 ',1,25) ,'Delimiter',',','HeaderLines',1, 'CollectOutput' ,true));
    end
    fclose(file_id);

    assert(~ isempty(A), ['Data at path ',utplot_path, ' is empty.' ] ); 

    li = length(A(:,1));
    i_last = find(A(2:li,1)-A(1:li-1,1)>0);
    time = [A(i_last,1);A(li,1)];%times = unique(A{1});
    lt = length(time);%find(ts(2:li)-ts(1:li-1)~=0);
    data = cell(lt,1);
    data{1} = A(1:i_last(1), indices); %[A{2}(1:i_last(1)),A{9}(1:i_last(1)),A{3}(1:i_last(1)),A{6}(1:i_last(1)),A{7}(1:i_last(1)),A{10}(1:i_last(1)),A{19}(1:i_last(1)),A{24}(1:i_last(1))];
    for i = 2:lt-1
        data{i} = A(i_last(i-1)+1:i_last(i), indices);% [A{2}(i_last(i-1)+1:i_last(i)),A{9}(i_last(i-1)+1:i_last(i)),A{3}(i_last(i-1)+1:i_last(i)),A{6}(i_last(i-1)+1:i_last(i)),A{7}(i_last(i-1)+1:i_last(i)),A{10}(i_last(i-1)+1:i_last(i)),A{19}(i_last(i-1)+1:i_last(i)),A{24}(i_last(i-1)+1:i_last(i))];
    end
    %        zuLHpvLBur{s,lt} = [A{2}(i_last(end)+1:lt),A{9}(i_last(end)+1:lt),A{3}(i_last(end)+1:lt),A{6}(i_last(end)+1:lt),A{7}(i_last(end)+1:lt),A{10}(i_last(end)+1:lt),A{19}(i_last(end)+1:lt)];
    data{lt} = A(i_last(i)+1:li, indices);%[A{2}(i_last(i)+1:li),A{9}(i_last(i)+1:li),A{3}(i_last(i)+1:li),A{6}(i_last(i)+1:li),A{7}(i_last(i)+1:li),A{10}(i_last(i)+1:li),A{19}(i_last(i)+1:li),A{24}(i_last(i)+1:li)];

end


