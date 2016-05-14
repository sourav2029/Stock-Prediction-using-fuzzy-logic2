
clear;
file='reliance_industries_ltd.xlsx'; % 
data=xlsread(file); % RawDATA 
data1=data(:,1:4); % for amit goyal's data  // 
closingP=data1(:,4); % to be predicted    for  
data2=[data1(:,1:3)]; % for amit Goyal 

 
