%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Adjusts an image by thresholding it against the mean for a local window of 'radius'.
%Just a quick test - doesn't perform as expected, but archiving the code.
%
%Jonathan Francis Roscoe
%07/04/2014 (based on work done earlier this year)
%jjr6@aber.ac.uk
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ out_im ] = NeighbourhoodBrightnessDev( im, radius)
    im = double(im);
    out_im = zeros(size(im));
    
    %for each pixel, get the radiusxradius neighbourhood
    for y=radius+1:size(im,1)-radius-1
        for x=radius+1:size(im,2)-radius-1
            window = im(y-radius:y+radius,x-radius:x+radius);
            m = mean(window(:));
                if m > im(y,x)
                    out_im(y,x) = 1;            
                else
                    out_im(y,x) = 0;            
                end
        end
        
    end
    


end