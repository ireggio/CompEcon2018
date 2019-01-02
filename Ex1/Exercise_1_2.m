clc;

disp('---------------------------------------------')
disp('Exercise 2a')
disp('---------------------------------------------')
disp(' ')

close all; clear all; 

disp('While loop')
macheps = 1;
while (1 + macheps/2) ~= 1.0
    macheps = macheps/2;
end
format long
disp(['Loop approximation gives eps=',num2str(macheps,20)]);
disp(['Matlab eps command gives eps=',num2str(eps,20)]);
disp(' ')

disp('While loop, single precision (not asked)')
macheps = single(1); 
while (1 + macheps/2) ~= 1.0 % all inherit smaller precision!
    macheps = macheps/2;
end
disp(['Loop approximation gives eps=',num2str(macheps,20)]);
disp(['Matlab eps command gives eps=',num2str(eps(single(1)),20)]);
disp(' ')

disp('For loop')
macheps = 1;
maxit=1e10;
for i=1:maxit
    if ((1 + macheps/2) ~= 1.0)
        macheps = macheps/2;
    else
        break
    end
end
disp(['Loop approximation gives eps=',num2str(macheps,20)]);
disp(['Matlab eps command gives eps=',num2str(eps,20)]);
disp('The for loop is well suited to this application.')
disp(' ')

disp('---------------------------------------------')
disp('Exercise 2b')
disp('---------------------------------------------')
disp(' ')

close all; clear all 

%A = [3,2; 1,1; -4,-1];
%B = [4,3; -1,3; 3,2];

A = rand(400, 600);
B = rand(size(A));

% matrix addition
disp('Matrix addition with matlab function')
tic;
C1 = A + B;
toc;

% for loop 
disp('Matrix addition with for loop')
tic;
C2 = zeros(size(A));
for i=1:size(C2,1)
    for j = 1:size(C2,2)
        C2(i,j) = A(i,j)+B(i,j);
    end
end
toc;


% matrix multiplication
disp('Matrix multiplication with matlab function')
tic;
D1 = A'*B;
toc;

disp('Matrix multiplication with for loop')
tic;
D2 = zeros(size(A,2)); 
Ap = A';
for i=1:size(D2,1),
    for j = 1:size(D2,2)
        D2(i,j) = Ap(i,:)*B(:,j);
    end
end
toc;

% side note: the matrix multiplication is NOT elementwise multiplication; 
E1 = A.*B;
