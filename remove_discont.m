function [ X_new, Y_new ] = remove_discont( X,Y, dy_dx_max )
% Returns the same vectors where a NaN has been placed in between the
% elements whereever a jump greater that dy_dx_max occurs in y.


assert(ndims(X)==ndims(Y));
assert(all(size(X)==size(Y)));

if size(X,1)==1, X=X.'; Y=Y.'; flip = true; else flip=false; end

[Ni,Nj] = size(X);
X_cell = cell(1,Nj);
Y_cell = X_cell;
i_max = 0;

for j = 1:Nj
    if nargin == 3
        dy_lim = dy_dx_max*diff(X(:,j));
        i_row = find(diff(Y(:,j)).^2 > dy_lim.^2);
    else
       i_row = find(abs(diff(X(:,j)))> .25*(max(X(:,j)-min(X(:,j))) ) );
    end
    i_row = unique(sort(i_row))';

    %%% non-loop alternative
    [x,y] = deal(nan(length(i_row)+Ni,1));
    i_non_nan = true(size(x));
    i_non_nan( i_row + (1:length(i_row)) ) = false;
    x(i_non_nan) = X(:,j);
    X_cell{j} = x;
    if nargin > 1
        y(i_non_nan) = Y(:,j);
        Y_cell{j} = y;
    end
    
    %%% loop alternative
%     count = 0;
%     for i_disc = i_row
%         y = [y(1:i_disc+count,:);NaN;y(i_disc+count+1:end,:)];
%         x = [x(1:i_disc+count,:);NaN;x(i_disc+count+1:end,:)];
%         count = count+1;
%     end
    %%%
    
    if numel(x)>i_max, i_max = numel(x); end
end


X_new = nan(i_max, Nj);
Y_new = X_new;
for j = 1:Nj
    X_new(1:numel(X_cell{j}),j) = X_cell{j};
    Y_new(1:numel(Y_cell{j}),j) = Y_cell{j};
end

if flip
    X_new = X_new.';
    Y_new = Y_new.';
end

end


