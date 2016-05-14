function [ pos ] = max_pos( x )
%this function return the position of the maximum element 
% which serve as cluster center 

maximum=0;
pos=1;
for i=1:size(x,2)
   p=x(i)
    if( x(i)>maximum )
          maximum=x(i);
          pos=i;
    end
end
end
disp('max potential is ');
disp(maximum);

