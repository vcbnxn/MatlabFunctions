%Circshift abuse for bit rotation of numeric types.
%Jonathan Francis Roscoe <jjr6@aber.ac.uk>

function [b] = BitRotate(d,n)

    b = dec2bin(d,8)';
    b = circshift(b,n)';

    b = bin2dec(b);
end