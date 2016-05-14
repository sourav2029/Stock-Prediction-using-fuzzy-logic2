
% following code builds mamdani fuzzy system  which have  3 input and one
% output  
% following are the the variable used here 
% 1. open price 
% 2. high price 
% 3. low price 
% 
%
%  output  variable 
% 1. close price 


a = newfis('stock_fuzzysystem');

% input 1 
a.input(1).name = 'open price';
a.input(1).range =   [775 1150];
a.input(1).mf(1).name = 'low';
a.input(1).mf(1).type = 'gaussmf';
a.input(1).mf(1).params =   [63.7 775];
a.input(1).mf(2).name = 'average';
a.input(1).mf(2).type = 'gaussmf';
a.input(1).mf(2).params =    [37.11 963]
a.input(1).mf(3).name = 'high';
a.input(1).mf(3).type = 'gaussmf';
a.input(1).mf(3).params =   [63.7 1150];

%input 2 
a.input(2).name = 'high price';
a.input(2).range =   [780 1160];
a.input(2).mf(1).name = 'low';
a.input(2).mf(1).type = 'gaussmf';
a.input(2).mf(1).params =     [60.31 789.9];
a.input(2).mf(2).name = 'average';
a.input(2).mf(2).type = 'gaussmf';
a.input(2).mf(2).params =     [51.43 972.7];
a.input(2).mf(3).name = 'high';
a.input(2).mf(3).type = 'gaussmf';
a.input(2).mf(3).params =    [64.55 1148];

%input 3 
a.input(3).name = 'low price';
a.input(3).range =     [780 1150];
a.input(3).mf(1).name = 'low';
a.input(3).mf(1).type = 'gaussmf';
a.input(3).mf(1).params =     [62.86 780];
a.input(3).mf(2).name = 'medium';
a.input(3).mf(2).type = 'gaussmf';
a.input(3).mf(2).params =      [38.66 965];
a.input(3).mf(3).name = 'high';
a.input(3).mf(3).type = 'gaussmf';
a.input(3).mf(3).params =    [62.86 1150];



%output 1 
a.output(1).name = 'closing price';
a.output(1).range =   [770 1140];
a.output(1).mf(1).name = 'low'
a.output(1).mf(1).type = 'trimf';
a.output(1).mf(1).params =     [652.5 772.2 910.5];
a.output(1).mf(2).name = 'average';
a.output(1).mf(2).type = 'trimf';
a.output(1).mf(2).params =    [880.1 982.2 1075];
a.output(1).mf(3).name = 'high';
a.output(1).mf(3).type = 'trimf';
a.output(1).mf(3).params =     [1012 1143 1295];

% define rule 

%rule 1 
a.rule(1).antecedent = [2 2 2];
a.rule(1).consequent = [2];
a.rule(1).weight = 1;
a.rule(1).connection = 1;    % for and use 1   for or use 2 

%rule 2 
a.rule(2).antecedent = [1 2 1 ];
a.rule(2).consequent = [1];
a.rule(2).weight = 1;
a.rule(2).connection = 1;

%rule 3 
a.rule(3).antecedent = [3 3  3];
a.rule(3).consequent = [3];
a.rule(3).weight = 1;
a.rule(3).connection = 1;

%rule 4 
a.rule(4).antecedent = [ 1 1 1 ];
a.rule(4).consequent = [1];
a.rule(4).weight = 1;
a.rule(4).connection = 1;



% evaluate  model 

train_input=train(:,1:3);   % selecting only  3 input variable
train_output=train(:,4);

test_input=test(:,1:3);
test_output=test(:,4);

train_predicted=evalfis(train_input,a);
test_predicted=evalfis(test_input,a);
n=size(train,1);
x=[1:n]; 

% x contains dates  or time 


% error calculation         
% fe will be used further for fuzzyerroralog with other abbriviation 
%% error on trainig data 

% plot grap of actual and predicted stock price 
n=size(train,1);
x=[1:n];
subplot(2,1,1);
plot(x,train_output,x,train_predicted,'r');
title('variation of stock price with time on traning data');
xlabel('time (days) from jan 2014 to april 2016 ');
ylabel('stock price ');
legend('actual stock price','predicted stock price','location','northwest');
fe=abs(train_output-train_predicted);
 
 % mean error
 mfe=sum(fe)/size(fe,1);
 disp('mean error in stock price prediction on training data is  ');
 disp(mfe);
 
 % percentage error 
  pfe=(sum(fe)/sum(train_output))*100;
  disp('percentage error in stock price prediction on trainig data is');
  disp(pfe);
  
  % mean square error 
  msfe=sum(fe.*fe)/size(fe,1);
  disp('mean square error on training data is');
  disp(msfe);
 
 %%  error on test data 
  % mean errorr
n=size(test,1);
x=[1:n];
subplot(2,1,2);
plot(x,test_output,x,test_predicted,'r');
title('variation of stock price with time on test data');
xlabel('time (days) from jan 2014 to april 2016 ');
ylabel('stock price ');
legend('actual stock price','predicted stock price','location','northwest');
fe=abs(test_output-test_predicted);
mfe=sum(fe)/size(fe,1);
disp('mean error in stock price prediction on test data is  ');
disp(mfe);
 
 % percentage error 
  pfe=(sum(fe)/sum(test_output))*100;
  disp('percentage error in stock price prediction on test  data is');
  disp(pfe);
  
  % mean square error 
  msfe=sum(fe.*fe)/size(fe,1);
  disp('mean square error on test data is');
  disp(msfe);
  

