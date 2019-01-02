clc
close all
clear all
format long
disp('---------------------------------------------')
disp('Exercise 4')
disp('---------------------------------------------')
disp(' ')

beta=[2 3 5]';
% We do both n=10, and n=100000 in a loop
for n=[10,100000]
    disp(['n=',num2str(n)]);
    rng('default'); % set the seed of the random number generator
    epsil = randn(n,1);
    X = rand(n,3)*100; % 3 regressors
    X(:,1)=1; % plus the constant
    y = X*beta + epsil;
    disp('------------------------');
    disp('4b) Using the formula');
    tic %keep track of time
    betahat = inv(X'*X)*(X'*y);
    toc
    disp('------------------------');
    disp('4c) Using backslash operator');
    tic
    betastar=X\y;
    toc
    disp('4c) Compare');
    vec=[betahat, betastar];
    disp('formula          backslash');
    disp(num2str(vec,10))
    disp(' ');
end
