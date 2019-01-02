
  clear all;
  clc;

  disp('---------------------------------------------')
  disp('Exercise 3')
  disp('---------------------------------------------')
  disp(' ');
  
  %disp('3a)');
  rng('default'); % set the seed of the random number generator
  % rng(123321);
  m = 10;
  X=randn(m,1);
  
  disp('3b)');
  mX = mean(X);
  sX = std(X);
  disp(['the mean (should be mu=0) is: ', num2str(mX)])
  disp(['the sd (should be sd=1) is: ', num2str(sX)])
  disp(' ');

   %disp('3c)');
    % calculate new random-number matrix Z and again the mean and std
   muZ = 1;
   sdZ =2;
   rng('default');
   Z = muZ + sdZ.*randn(m,1);
   disp('3d)');
   mZ = mean(Z);
   sZ = std(Z);  
   disp(['the mean (should be mu=1) is: ', num2str(mZ)])
   disp(['the sd (should be sd=2) is: ', num2str(sZ)])
   disp(' ');
   
    disp('3e)');
    disp('---------------------------------------')
    for m=[10,1000,1000000];
      rng('default'); % set the seed of the random number generator
      X=randn(m,1);

      disp(['Exercise 3b) for m=', num2str(m)]);    
      mu = mean(X);
      sd = std(X);
      disp(['the mean (should be mu=0) is: ', num2str(mu)])
      disp(['the sd (should be sd=1) is: ', num2str(sd)])
      disp(' ');

      disp(['Exercise 3d) for m=', num2str(m)]);
      % calculate new random-number matrix Z and again the mean and std
      must=1;
      sdst=2;
      rng('default');
      Z=must+sdst.*randn(m,1);
      mu = mean(Z);
      sd = std(Z);
      disp(['the mean (should be mu=1) is: ', num2str(mu)])
      disp(['the sd (should be sd=2) is: ', num2str(sd)])
      disp(' ');
  end
   
   
  