function [final_data,final_label] = NCL(train,train_labels)
%minority class label=1 && majority class label=0
k=3;%number of nearest neighbors| k=3 is the default of NCL
final_data=train;
final_label=train_labels;
[m,n]=size(train);
remove=zeros(m,1); % defines which sample of the train set should be removed
for i=1:m
    data=train(i,:);
    for j=1:m
        Distance(j)=pdist2(data,train(j,:));
    end
    [s_dist,s_loc]=sort(Distance);
    neighbors_ind=s_loc(2:k+1);
    nb_labels=train_labels(neighbors_ind);
    if train_labels(i)==0
        if sum(nb_labels)>=ceil(k/2)
            % if train(i) is a majority sample and misclassified by its nearest neighbors 
            remove(i)=1;
            % train(i) is noisy sample
        end
    elseif train_labels(i)==1
        if sum(nb_labels)<=floor(k/2)
            % if train(i) is a minority sample and is misclassified by its nearest neighbors 
            remove(neighbors_ind(nb_labels==0))=1;
            % the majority nearest neighbors are removed
        end
    end
end
 final_data(remove==1,:)=[];
 final_label(remove==1)=[];
            
            
end
        
