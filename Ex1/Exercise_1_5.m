close all; 
clear all 
clc;
disp('---------------------------------------------')
disp('Exercise 5')
disp('---------------------------------------------')
disp(' ')

lambda=14400;

%% Step 1: Read Data
% load('data/JKdata.mat');
JKdata = xlsread('data/workerflows.xlsx','Tabelle1','A2:F298');
logadjsep = log(JKdata(:,2));  % EU transition
logadjfin = log(JKdata(:,4));  % UE transition
months = linspace(JKdata(1,1),2004.50,length(logadjsep))';


%% Step 2: Apply HP-Filter
logadjsepHP_T = hpfilter(logadjsep,lambda); logadjsepHP_C = logadjsep - logadjsepHP_T;
logadjfinHP_T = hpfilter(logadjfin,lambda); logadjfinHP_C = logadjfin - logadjfinHP_T;


%% Step 3: Plot
% the next plot is not required
figure;
plot(months, JKdata(:,2), months, exp(logadjsepHP_T), 'LineWidth', 2.0); 
xlabel('year'); xlim([min(months),max(months)]);
legend('data','HP trend', 'Location','NorthEast');
title('Employment-Unemployment transition rates, \pi(e|u)')

figure;
plot(months, JKdata(:,4), months, exp(logadjfinHP_T), 'LineWidth', 2.0); 
xlabel('year'); xlim([min(months),max(months)]);
legend('\pi(u|e) HP trend','\pi(e|u) HP trend', 'Location','NorthEast');
legend('data','HP trend', 'Location','NorthEast');
title('Unemployment-Employment transition rates, \pi(u|e)')

figure;
plot(months, logadjfinHP_C, 'b--', months, logadjsepHP_C, 'r-', 'LineWidth', 2.0); 
xlabel('year'); xlim([min(months),max(months)]);
legend('\pi(u|e): deviation from trend','\pi(e|u): deviation from trend','Location','NorthEast');
title('Cyclical components of EU and UE transition rates')
