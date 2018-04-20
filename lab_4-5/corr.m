function result = corr(input_signal, synchro_part)
% Determines the first occurrence of 
%   a parcel in the input signal
%
% Input :   input_signal -- input
%           synchro_part -- the signal to start sending
%
% Output :  result-the package

for i = 2 : length(synchro_part)
    input_signal = [input_signal 0];
end
number_of_sychro = length(input_signal);
for i = 1 : (length(input_signal) ...
        -length(synchro_part) +1)
    part = input_signal(i : (i +length(synchro_part) -1));
    if (part == synchro_part)
        number_of_sychro = i;
        break;
    end
end
if number_of_sychro < length(input_signal)
    end_of_data = number_of_sychro ...
        +7 +length(synchro_part);
else
    end_of_data = length(input_signal);
end
result = input_signal(number_of_sychro ...
    +length(synchro_part) : end_of_data);
end
