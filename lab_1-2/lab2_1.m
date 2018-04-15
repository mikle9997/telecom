close all;
clear all;

input_signal = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ];
synchro_part = [1 0 1];

number_of_true = 0;
for i = (corr(input_signal, synchro_part) ...
        == [0 1 1 1 0 0 0 0])
    number_of_true = number_of_true + i;
end
assert(number_of_true == 8);

%--------------------------------------------------------%

input_signal = [1 1 1 0 1 1 0 0 1 0 1 1 ...
    0 1 1 0 1 0 0 0 0 1 1 0 1];
synchro_part = [0 1 0 1];

number_of_true = 0;
for i = (corr(input_signal, synchro_part) ...
        == [1 0 1 1 0 1 0 0])
    number_of_true = number_of_true + i;
end
assert(number_of_true == 8);

%--------------------------------------------------------%

input_signal = [1 0 1 1 0 1 0 1 1 1 1 1 0 ...
    1 0 0 0 1 0 1 0 1 0 1 0 1 1 0 0 0 1];
synchro_part = [1 1 1 1 1];

number_of_true = 0;
for i = (corr(input_signal, synchro_part) ...
        == [0 1 0 0 0 1 0 1])
    number_of_true = number_of_true + i;
end
assert(number_of_true == 8);
