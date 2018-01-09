function [ final_train ] = RUS( final_ratio,train,train_labels )
%Minority class label is 1; Majority class label is 0
final_train=train;
MAJ_num=final_ratio.*length(find(train_labels==1));
MAJ_ind=find(train_labels==0);
MAJ_size=length(MAJ_ind);
rand_ind=randperm(MAJ_size);
remove_ind=rand_ind(1:MAJ_size-MAJ_num);
final_train((MAJ_ind(remove_ind)),:)=[];
end

