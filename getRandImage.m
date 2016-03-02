clc;
clear;
file_path_notdog = '/Users/Serena/Documents/MATLAB/541FINAL/notdog/';
img_path_list_notdog = dir(strcat(file_path_notdog,'*.jpg'));
%get the lable of dog's images
%get the path of the train dog 
fid_train = fopen('/Users/Serena/Documents/MATLAB/541FINAL/train.txt','wt');
fid_test = fopen('/Users/Serena/Documents/MATLAB/541FINAL/test.txt','wt');
randNum = randperm(2000);
for i = 1 : 1500
    %train_dog(i) = randNum(i);
    image_name = img_path_list_notdog(randNum(i)).name;
    tmp = strcat(image_name,' 0');
    train_notdog_path{i} = strcat(file_path_notdog,tmp);
    train_notdog_path = train_notdog_path'; 
    fprintf(fid_train,'%s\n',train_notdog_path{i}); 
end
% train_notdog_class = num2cell(zeros(1500,1));
% train_notdog = [train_notdog_path,train_notdog_class];

file_path_dog = '/Users/Serena/Documents/MATLAB/541FINAL/dog/';
img_path_list_dog = dir(strcat(file_path_dog,'*.jpg'));
%get the lable of dog's images
%get the path of the train dog 
randNum2 = randperm(2000);
for i = 1 : 1500
    %train_dog(i) = randNum(i);
    image_name = img_path_list_dog(randNum2(i)).name;
    tmp = strcat(image_name,' 1');
    train_dog_path{i} = strcat(file_path_dog,tmp);
    train_dog_path = train_dog_path';
    fprintf(fid_train,'%s\n',train_dog_path{i});
end

for i = 1501 : 2000
    %test_dog(i-1500) = randNum(i);
    image_name = img_path_list_notdog(randNum(i)).name;
    tmp = strcat(image_name,' 0');
    test_notdog_path{i-1500} = strcat(file_path_notdog,tmp);
    test_notdog_path = test_notdog_path';
    fprintf(fid_test,'%s\n',test_notdog_path{i-1500});
end

for i = 1501 : 2000
    %test_dog(i-1500) = randNum(i);
    image_name = img_path_list_dog(randNum2(i)).name;
    tmp = strcat(image_name,' 1');
    test_dog_path{i-1500} = strcat(file_path_dog,tmp);
    test_dog_path = test_dog_path';
    fprintf(fid_test,'%s\n',test_dog_path{i-1500});
end
fclose(fid_test);
fclose(fid_train);