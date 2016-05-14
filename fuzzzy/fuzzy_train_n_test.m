%function training_n_test_gen()
clc;
%mat=rand(10,5);
mat=[closingP ,data2]; % index is to be predicted   DATA2 contains only atributes 
r=size(mat,1); % find the number of rows 
c=size(mat,2); % find the number of columns 
% we are using 70 percentage of data 
no_of_Test=round(r*0.3); % no of  of test records 
no_of_Train=r-no_of_Test; % # of training record 
Select_Row=randperm(r,no_of_Train); % randomly select trainig record 
Select_Row=sort(Select_Row);   %  sort selected rows 
j=1;
train=zeros(no_of_Train,c);   % define trainig matrix 
test=zeros(no_of_Test,c);      % define TEST matrix 
n_tst=1;                        % used for matrix initialisation
n_trn=1;                        % used for matrix initialaisation 
limit=size(Select_Row,2);
%display(Select_Row);        
% to select perticlular row use mat(row_number,:) here : means all columns 
% to select perticlular clumn use mat(:,column number)
for i=1:r
   %display(i)
   %x=Select_Row(j);
   %display(x);
   
     if j<=limit && i==Select_Row(j)  
          %display('if is true');
          train(n_trn,:)=mat(i,:);
          %display(train(n_trn,:));
          n_trn=n_trn+1;
          j=j+1;
      else 
        test(n_tst,:)=mat(i,:);
        n_tst=n_tst+1;
      end
 end
display(train,'taining data');
display(test,'test data');
% find the range of value to define the membership function 
range=zeros(4,2);
for i=1:4
  range(i,1)=min(mat(:,i));
  range(i,2)=max(mat(:,i));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%    Apply linear regression %%%%%%%%%%%%%%%%%%%%%%%
%y=test(:,1);
%x=test(:,2:end);
%[p,stats]=quantreg(x,y,.25);
%plot(x,y,x,polyval(p,x),x,stats.yfitci,'k:');

