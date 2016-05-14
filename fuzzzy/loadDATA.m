%function loadDATA()
%....... load data file ( xlsx )................%
%data will be in matrix form with 18 columns initialy  we nead to combine
%certain column in order to reduce dimentaionality .............% 
clear;
file1='goyalwelch.xlsx';
file2='Shiller.xls';
file3='DATA.xlsx'; % amit Goyal's DATA 
RD1=xlsread(file3); % RawDATA 
%INDEX=RD(:,2);
%RD=load(file4); % airfoil 
%INDEX=RD(:,6);  % airfoil 
%DATA2=RD(:,1:5);%airfoil 
%RD1=xlsread(file2);
RD=RD1(954:end,:); % for amit goyal's data  // actual value = 674  second value is 954
%RD1=RD1(:,[2:4 6 19]);

% RD1 contains 
% 1        2           3           4          5 
%  stock  divident    earnig     govt bond    p/e
%  price 
%display(RD1);
%transform RawDATA 




%data=[RD(:,2),RD1(:,3)];
INDEX=log(RD(:,2)); % to be predicted    for amit goyal data 
%DATA1=[log(RD1(:,2))-log(RD1(:,1)),RD(:,14),1./RD1(:,5),log(RD(:,14))-log(RD(:,15)),RD(:,18:20),RD(:,5:7),RD(:,6)-RD(:,5),RD(:,9)-RD(:,8),RD(:,11)-RD(:,7),RD(:,4),RD(:,24)];
%DATA2=[log(RD(:,3))-log(RD(:,2)),RD(:,2),log(RD(:,2))-log(RD(:,4)),RD(:,15),RD(:,5),RD(:,10),RD(:,6),RD(:,9),RD(:,13),RD(:,8)-RD(:,7),RD(:,14)-RD(:,13),RD(:,12)];
DATA2=[RD(:,3:6),RD(:,8)-RD(:,7),RD(:,9:10),RD(:,12:15)]; % for amit Goyal 
%DATA=RD(:,[2:8]); 
%nrows=size(DATA2,1);
%ncols=size(DATA2,2);
%newdata=[DATA2 ones(nrows,1)];
%[p,stats]=quantreg(newdata,INDEX,.25);
 % plot(x,y,x,polyval(p,x),x,stats.yfitci,'k:') plot(x,y,x,polyval(p,x),x,stats.yfitci,'k:')
 % plot(x,y,x,polyval(p,x),x,stats.yfitci,'k:')
  
 
