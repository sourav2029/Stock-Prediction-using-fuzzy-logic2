
% following code builds mamdani fuzzy system  which have  5 input and one
% output  
% following are the the variable used here 
% 1. index        S&P 500 index, [ output ] 

% 2. D12 (s&p divident yeald )   [ input] 
% 3. E12 (s&p earning yeald)     [ input ] 
% 4. b/m(book to market price ratio)[ input ] 
% 5. tbl(treasury bill)              [ input ] 
% 6. AAA(High-Quality Corporate Bond Yield, usually long-term)
% 7. BAA(Mid-Quality Corporate Bond Yield, usually long-term)
%                           [ both 6 and 7 are used here and 
%                           combined together: 7-6] 
% we are using here  BAA-AAA as input variable 

a = newfis('fuzzysystem_reduced');

% input 1 
a.input(1).name = 'D12';
a.input(1).range = [1 40];
a.input(1).mf(1).name = 'low';
a.input(1).mf(1).type = 'gaussmf';
a.input(1).mf(1).params =  [7.229 1];
a.input(1).mf(2).name = 'medium';
a.input(1).mf(2).type = 'gaussmf';
a.input(1).mf(2).params =  [4.52 20.2];
a.input(1).mf(3).name = 'high';
a.input(1).mf(3).type = 'gaussmf';
a.input(1).mf(3).params = [7.054 40];

%input 2 
a.input(2).name = 'E12';
a.input(2).range = [1 107];
a.input(2).mf(1).name = 'low';
a.input(2).mf(1).type = 'gaussmf';
a.input(2).mf(1).params =   [18.01 1];
a.input(2).mf(2).name = 'medium';
a.input(2).mf(2).type = 'gaussmf';
a.input(2).mf(2).params =    [12.29 54];
a.input(2).mf(3).name = 'high';
a.input(2).mf(3).type = 'gaussmf';
a.input(2).mf(3).params =  [21.08 107];

%input 3 
a.input(3).name = 'B/m';
a.input(3).range =  [0.1 1.5];
a.input(3).mf(1).name = 'low';
a.input(3).mf(1).type = 'gaussmf';
a.input(3).mf(1).params =   [0.2379 0.1];
a.input(3).mf(2).name = 'medium';
a.input(3).mf(2).type = 'gaussmf';
a.input(3).mf(2).params =    [0.1469 0.8];
a.input(3).mf(3).name = 'high';
a.input(3).mf(3).type = 'gaussmf';
a.input(3).mf(3).params =  [0.2379 1.5];

%input 4 
a.input(4).name = 'tbl';
a.input(4).range =  [0 2];
a.input(4).mf(1).name = 'low';
a.input(4).mf(1).type = 'gaussmf';
a.input(4).mf(1).params =    [0.3398 1.388e-17];
a.input(4).mf(2).name = 'medium';
a.input(4).mf(2).type = 'gaussmf';
a.input(4).mf(2).params =    [0.2227 1];
a.input(4).mf(3).name = 'high';
a.input(4).mf(3).type = 'gaussmf';
a.input(4).mf(3).params =  [0.34 1.99];

%input 5 
a.input(5).name = 'BAA_AAA';
a.input(5).range =   [0.003 0.05];
a.input(5).mf(1).name = 'low';
a.input(5).mf(1).type = 'gaussmf';
a.input(5).mf(1).params =   [0.007985 0.003];
a.input(5).mf(2).name = 'medium';
a.input(5).mf(2).type = 'gaussmf';
a.input(5).mf(2).params =    [0.004109 0.0265];
a.input(5).mf(3).name = 'high';
a.input(5).mf(3).type = 'gaussmf';
a.input(5).mf(3).params =   [0.007985 0.05];

%output 1 
a.output(1).name = 'index';
a.output(1).range = [1 8];
a.output(1).mf(1).name = 'low'
a.output(1).mf(1).type = 'trimf';
a.output(1).mf(1).params =   [-1.8 1 3.408];
a.output(1).mf(2).name = 'average';
a.output(1).mf(2).type = 'trimf';
a.output(1).mf(2).params =  [2.07 4.16 6.29];
a.output(1).mf(3).name = 'high';
a.output(1).mf(3).type = 'trimf';
a.output(1).mf(3).params =   [5.454 8 10.8];

% define rule 

%rule 1 
a.rule(1).antecedent = [1 1 2 1 1];
a.rule(1).consequent = [2];
a.rule(1).weight = 2;
a.rule(1).connection = 1;    % for and use 1   for or use 2 

%rule 2 
a.rule(2).antecedent = [2 2 1 1 1];
a.rule(2).consequent = [3];
a.rule(2).weight = 1;
a.rule(2).connection = 1;

%rule 3 
a.rule(3).antecedent = [1 1 2 1 1 ];
a.rule(3).consequent = [2];
a.rule(3).weight = 1;
a.rule(3).connection = 1;

%rule 4 
a.rule(4).antecedent = [2 3 1 1 1 ];
a.rule(4).consequent = [3];
a.rule(4).weight = 1;
a.rule(4).connection = 1;

%rule 5 
a.rule(5).antecedent = [1 1 2 1 1];
a.rule(5).consequent = [1];
a.rule(5).weight = 1;
a.rule(5).connection = 1;

% evaluate  model 
inputdata=DATA2(:,1:5);   % selecting only  3 input variable
predicted=evalfis(inputdata,a);
x=RD(:,1); % x contains dates  or time 
plot(x,INDEX,x,predicted,'r');
title('variation of stock price with time');
xlabel('time (in month)');
ylabel('stock price (after applying log)');
legend('actual stock price','predicted stock price','location','northwest');

% error calculation         
% fe will be used further for fuzzyerroralog with other abbriviation 

% mean errorr
 fe=abs(INDEX-predicted);
 mfe=sum(fe)/size(fe,1);
 disp('mean error in stock price prediction is ');
 disp(mfe);
 
 % percentage error 
  pfe=(sum(fe)/sum(INDEX))*100;
  disp('percentage error in stock price prediction is');
  disp(pfe);
  
  % mean square error 
  msfe=sum(fe.*fe)/size(fe,1);
  disp('mean square error is');
  disp(msfe);
 

