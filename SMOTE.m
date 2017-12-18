function [ new_data,new_data_label ] = SMOTE( train,train_label,k,min_num,gen_num ) 
Smin=train(find(train_label==1),:);
Smaj=train(find(train_label==0),:);
RAND=randperm(size(Smin,1));
select_ind=RAND(1:min_num);
X_new=[];
for i=1:min_num
    selected_min=Smin(select_ind(i),:);
    neighbors  = nearest_neighbor( selected_min, train,k );
    for j=1:gen_num
        x=neighbors(randi(k),:);
        x_new(j,:)=selected_min+rand.*(selected_min-x);
    end
    X_new=[X_new;x_new];
end

new_data=[Smaj;Smin;X_new];
new_data_label=[zeros(size(Smaj,1),1);ones(size(Smin,1),1);ones(size(X_new,1),1)];
end

