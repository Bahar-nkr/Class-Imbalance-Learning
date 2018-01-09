function [ final_train,final_trainlabels ] = ROS( final_ratio,train,train_labels )
%Minority class label is 1; Majority class label is 0
final_train=train;
final_trainlabels=train_labels;
MIN_num=length(find(train_labels==0))./final_ratio;
MIN_ind=find(train_labels==1);
MIN_size=length(MIN_ind);
for i=1:(MIN_num-MIN_size)
    replicate_ind=randi(MIN_size);
    final_train=[final_train;train((MIN_ind(replicate_ind)),:)];
    final_trainlabels=[final_trainlabels;train_labels(MIN_ind(replicate_ind))];
end
end

