% find the potential of data points to be a cluster center and then find cluster center 
% use of subtractive clustering 
%   formula used 
% number of data points  = ndp
%
%


nc=4;% number of clusters       can change it 

mat=[INDEX ,DATA2]; % index is to be predicted   DATA2 contains only atributes 
ndp=size(mat,1); % find the number of rows 
dist=0;
ra=0.5;        % ra is a vector which consists of positive constants and represents the hyper
               % sphere cluster radius in data space. 
rb=1.5*ra      % rb is a vector which consists of positive constants and is called the hyper
               % sphere penalty radius.    standard value is 1.5 for % constant 
               % constant 
a=4/(ra*ra);
b=4/(rb*rb);
potential=zeros(ndp,1);
cp=zeros(4,1);   %  stores cluster potential 
ci=zeros(4,1);   %  stores cluster indices 
% calculating potential of data points 
disp(' press enter to continue ');
 pause
for i=1:ndp
    for j=1:ndp
     dist=fun_distance(mat(i,:),mat(j,:));
     potential(i)=potential(i)+exp(dist*a*(-1));
    end
end
% finding point which has largest potential 
[cp(1),ci(1)]=max(potential);
disp(' press enter to continue ');
pause;
for c=2:nc;
 for i=1:ndp
 for j=1:ndp
 dist=fun_distance(mat(i,:),mat(j,:));
 potential(i)=potential(i)-cp(c-1)*exp(dist*b*(-1));
 end
 end
  
 disp('cluster ')
 disp(c);
 disp(' press enter to continue ');
 pause
 [cp(c),ci(c)]=max(potential);
end
disp('clustering done ');