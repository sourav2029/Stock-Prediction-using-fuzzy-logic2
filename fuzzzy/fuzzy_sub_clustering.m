% subtractive clustering
%The function returns the cluster centers in the matrix C.
%Each row of C contains the position of a cluster center. 
%The returned S vector contains the sigma values that specify the range of 
%influence of a cluster center in each of the data dimensions. 
%All cluster centers share the same set of sigma values.
[c,s]=subclust(train,0.5);
%The matrix X contains the data to be clustered; each row of X is a data point.
%The variable radii is a vector of entries between 0 and 1 that specifies a cluster 
%center's range of influence in each of the data dimensions, assuming the data falls
%within a unit hyperbox. Small radii values generally result in finding a few large 
%clusters. The best values for radii are usually between 0.2 and 0.5.