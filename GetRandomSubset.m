%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Returns a random subset of rows from m.
%%
%%jjr6@aber.ac.uk
%%08/09/2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ r ] = GetRandomSubset( m, percent )

    total_rows = size(m, 1);
    num_rows_to_get = floor((total_rows / 100) * percent);
    
    indices = randperm(total_rows);
    
    %choose percent number of indices
    indices = indices(1:num_rows_to_get);
    
    r = m(indices,:);

end

