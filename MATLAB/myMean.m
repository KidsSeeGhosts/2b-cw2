function Y = myMean(X) %X is a matrix

for i = 1:size(X,2) %no. of columns
    total = 0;
    for j = 1:size(X,1) %no. of rows
        total = total+X(j,i);
    end
    Y(1,i) = total./size(X,1);
end
end

