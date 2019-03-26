%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
%  Ks = [1,3,5,10,20];
%  task2_1(Xtrn, Ytrn, Xtst, Ytst, Ks);

[Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
%measure this run time
for i = 1:length(Ks)
    k = Ks(i);
    Ypreds = Ypreds(:,k);
    Ytrues = Ytrain;
    CMFileName = ['task2_1_cm',num2str(k),'.mat'];
    [CM, acc] = comp_confmat(Ytrues, Ypreds, k);
    save(CMFileName, 'CM');
    nOfSamples = length(Ytrues);
    Nerrs = (nOfSamples*(1-acc));
    disp(k);
    disp(nOfSamples); %number of test samples
    disp(Nerrs);
    disp(acc);
end
