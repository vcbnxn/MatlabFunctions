%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Log-likelihood function.
%
%Structure as required by knnsearch.m:
%                                   function D2 = DISTFUN(ZI, ZJ),
%  
%                                   taking as arguments a 1-by-N vector ZI
%                                   containing a single row of X or Y, an
%                                   M2-by-N matrix ZJ containing multiple
%                                   rows of X or Y, and returning an
%                                   M2-by-1 vector of distances D2, whose
%                                   Jth element is the distance between the
%                                   observations ZI and ZJ(J,:).
%
%Takes two vectors.
%
%jjr6@aber.ac.uk
%19/02/2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ L ] = LogLikelihood(sample, models)
    B = length(sample);
    
    if size(models, 2)~= B
        error('Mismatched vector lengths!');
    end
    
    
    model_count = size(models,1);
    L = zeros(model_count, 1);
    
    %compare the sample to each model
    for m=1:model_count
        model = models(m,:);
        L(m) = 2.*(sum((sample.*log(sample+eps)) - (sample.*log(model+eps))));
    end
    
end
