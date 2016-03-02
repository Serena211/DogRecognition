function [ target ] = getKnn( in, out, test, k )
%KNN Summary of this function goes here
%http://blog.csdn.net/xlm289348/article/details/8876353
% in:       training samples data,n*d matrix
% out:      training samples' class label,n*1
% test:     testing data
% target:   class label given by knn
% k:        the number of neighbors
    ClassLabel=unique(out);
    c=length(ClassLabel);
    n=size(in,1);
    % target=zeros(size(test,1),1);
    dist=zeros(n,1);
    for j=1:size(test,1)
        cnt=zeros(c,1);
        for i=1:n
            dist(i)=norm(in(i,:)-test(j,:));
        end
        [~,index]=sort(dist);
        for i=1:k
            ind=find(ClassLabel==out(index(i)));
            cnt(ind)=cnt(ind)+1;
        end
        [~,ind]=max(cnt);
        target(j)=ClassLabel(ind);
    end
    target = target';

end

