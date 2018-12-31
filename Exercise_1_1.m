
close all
clear all
clc

format long %Long, fixed-decimal format with 15 digits after the decimal point

disp('---------------------------------------------')
disp('Exercise 1')
disp('---------------------------------------------')
disp(' ')
fprintf('\n') % two ways of adding a new line

% Our data:
A=[2 0 1; 
   0 4 1; 
   1 -1 4];
b=[30 40 15]';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional stuff:
% Compute the solution using a function:
% a function is written in a different m file called as the function
% in this case matvecmult
Ab = matvecmult(A,b);
c = b/2;
Ac = matvecmult(A,c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Question 1:
disp('Backslash operator')
x=A\b;
disp(['The solution vector is: ', num2str(x')])
disp('Direct method.')
disp(' ')

%% Additional: using matrix inversion
disp('Matrix Inversion')
x = inv(A)*b;
disp(['The solution vector is: ', num2str(x')])
disp('It is a direct method.')
disp(' ')

%%
%%%%%%%%%%%%%%%%%
% General Settings for iterative methods
max_it = 10000; %max. number of iterations
tol = 1e-6; %tolerance: iteration will continue until the norm of dx falls below this number
rng('default'); %to get always the same random number
x_init=randn(length(b),1)*10; %initial guess for x (typical guesses zero vector, or b)

disp('Jacobi method from the Web') %We only add some commands to display the info we want
[x, error, iter, flag]  = jacobi(A, x_init, b, max_it, tol);
if flag == 0 
    disp('Convergence successfull')
    disp(['Converged at iteration #: ', num2str(iter)])
    disp(['The solution vector is: ', num2str(x')])
else 
    disp('Convergence failed')
end
disp(' ')

disp('Jacobi method self-programmed from lecture notes')
% 1. define Q (here: only the diagonal elements)
% I=eye(3,3); 
% Q=A.*I; % Alternative calculation of Q
Q=diag(diag(A)); %diagonal matrix with the diagonal elements of A
Qinv=inv(Q);
x=x_init;
% 2. Start iteration
for it=1:max_it
    %it; 
    dx=Qinv*(b-A*x); %formula from lecture notes
    x=x+dx;
    if norm(dx)<tol, break, end %stops if difference less than tol
    if it>=max_it, disp('No Convergence'), end %just to display the info
end
disp(['Converged at iteration #: ', num2str(it)])
disp(['The solution vector is: ', num2str(x')])
disp(' ')

% Compute the condition number using command cond
disp(['Condition number is: ',num2str(cond(A))]);
disp('If b changes by 1%, solution x changes by at most 3%. This is very low.')

%%
%%% Additional stuff:
disp('-----------------------')
disp('Additional Stuff: change in b')
%%% Change b1 by 1% and compute the solution again: xnew
xnew=x_init;
bnew = b;
bnew(1) = b(1)*1.01;
% 2. Start iteration
for it=1:max_it
    dx=Qinv*(bnew-A*xnew);
    xnew=xnew+dx;
    if norm(dx)<tol, break, end
    if it>=max_it, disp('No Convergence'), end
end
disp(' ')
disp(['The solution vector is: ', num2str(xnew')])
d = xnew./x; %xnew relative to x
disp('new solution relative to original')
disp(d)

% -------------------------------------------------------------------------
disp(' ')
disp('---------------------------------------------')
disp('Additional Stuff:')
disp('Large Condition number example')
% Example with condition number:
AA = [4.1 2.8; 9.7 6.6];
bb = AA(:,1);
xx = AA\bb;
cn = cond(AA);
fprintf('Condition number is %4.4f\n',cn)
fprintf('Solution original problem is %2.1f, %2.1f \n',xx(1),xx(2))
% Now add 0.01 to the first component of b
bb2 = bb;
bb2(1) = bb(1) + 0.01;
% The solution changes dramatically:
xx2 = AA\bb2;
fprintf('The new solution with new b is %2.1f, %2.1f \n',xx2(1),xx2(2))

disp(' ')
disp('---------------------------------------------')
disp('LU decomposition in matlab')
%Note: LU factorization:
disp('L and U matrices')
[L,U]=lu(A)
%Step1:
y = L\b;
x = U\y;
disp(['The solution vector for y is: ', num2str(y')])
disp(['The solution vector is: ', num2str(x')])

disp(' ')
disp('---------------------------------------------')
disp('Gauss-Seidel method from the Web')
x = Gauss_Seidel(A, b);
disp(['The solution vector is: ', num2str(x')])
disp(' ')

disp('Gauss-Seidel method self-programmed from lecture notes')
% 1. define Q (here: only the diagonal elements)
% I=eye(3,3); 
% Q=A.*I; % Alternative calculation of Q
Q=tril(A);
Qinv=inv(Q);
x=x_init;
% 2. Start iteration
for it=1:max_it
    %it;
    dx=Qinv*(b-A*x);
    %dx=Q\(b-A*x2); % Alternative calculation
    x=x+dx;
    if norm(dx)<tol, break, end
    if it>=max_it, disp('No Convergence'), end
end
disp(['Converged at iteration #: ', num2str(it)])
disp(['The solution vector is: ', num2str(x')])
disp(' ')
