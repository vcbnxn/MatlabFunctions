%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Given an image and a mask, determines the effectiveness of the
%classification with a specific area specified by a second mask.
%%
%%classperf would probably be more suitable for newer version of matlab.
%%
%%true_positive_rate aka sensitivity
%%false_positive_rate aka fall-out or 1-specificiity
%%true negative_rate aka specificity
%%false_negative_rate aka miss rate
%%accuracy - a basic measure of accuracy between 0 and 1 per Zhang 2001, eq. 1 "A review of recent evaluation methods for image segmentation"
%%
%%image - the (binary) image to be checked
%%t_mask - truth mask
%%other_mask - a mask of the region to be evaluated
%%
%%jjr6@aber.ac.uk
%%04/09/2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ true_positive_rate, false_positive_rate, true_negative_rate, false_negative_rate, accuracy, dice] = EvaluateSegmentation( image, t_mask, other_mask )
    % just in case the mask isn't logical
    other_mask = logical(other_mask);
    t_mask = logical(t_mask);
    other_mask(t_mask) = 0;
    
	%store in variables for tidier code
    actual_positives = sum(t_mask(:));
    actual_negatives = sum(other_mask(:));
    number_of_pixels = numel(image);
    
	%basics
    true_positives = sum(sum(image.*t_mask));    
    false_positives = sum(sum(image.*other_mask));    
    true_negatives =  sum(sum(~image.*other_mask));    
    false_negatives = sum(sum(~image.*t_mask));
    
    
	%rates
    true_positive_rate = true_positives / (true_positives + false_positives);    
    false_positive_rate = false_positives / (false_positives + true_positives);    
    true_negative_rate = true_negatives /  (false_negatives + true_negatives);    
    false_negative_rate = false_negatives / (true_negatives + false_negatives);
    
	%accuracy
    accuracy = (true_positives + true_negatives) / (true_positives + true_negatives + false_positives + false_negatives); %correctly classified / total number of to find
    
	%Sorensen dice coefficient
    dice = 2*true_positives / ((false_positives+true_positives)+(true_positives+false_negatives));
end

