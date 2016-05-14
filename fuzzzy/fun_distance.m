% this file calculate distance between two points 
function dist=fun_distance(x1,x2)
x1=x1-x2;
x1=x1.*x1;
l=size(x1,1);
sum=0;
for i=1:l
    sum=sum+x1(i);
end
disp('distance is calculated');
dist=sqrt(sum);
disp(dist);


    


