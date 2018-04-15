close all;
clear all;

X = [0 0 0 1 0 1 0 1 1 1 0 0 0 0 1 0 ];
Y = [1 0 1];

tcorr1 = [];
tcorr2 = [];
tcorr3 = [];
array_with_len   = [];
step_of_for = 500;
len_of_package = step_of_for;

% corr1 = xcorr(X,Y);
% corr1 = corr1 / max(corr1);
% plot(corr1);
% ylim([-0.05,1.05]);
% xlabel('number of element');
% ylabel('resulting factor');
% 
% figure;
% F1 = fft(X, length(X));
% F2 = fft(Y, length(X));
% comp = conj(F2);
% corr2 = ifft(comp.*F1/ max(comp)) ;
% plot(corr2);
% xlim([0,35]);
% ylim([-0.05,1.05]);
% xlabel('number of element');
% ylabel('resulting factor');

for i = 0 : 50
    array_with_len = [array_with_len, len_of_package];
    X = randi(2, len_of_package, 1) - 1;
    X = X';
    
    tic();
    xcorr(Y, X);
    tcorr1 = [tcorr1, toc()];
    
    tic();
    F1 = fft(X, length(X));
    F2 = fft(Y, length(X));
    comp = conj(F2);
    corr2 = ifft(comp.*F1);
    tcorr2 = [tcorr2, toc()];  
    
    tic();
    corr(X,Y);
    tcorr3 = [tcorr3, toc()];
    
    len_of_package = len_of_package + step_of_for
end

plot(array_with_len, tcorr1, 'b', array_with_len,  ...
    tcorr2, 'r', array_with_len, tcorr3, 'g');
xlabel('length of package ');
ylabel('execution time, sec');