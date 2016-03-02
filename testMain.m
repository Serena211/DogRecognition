clc;
clear all;
close all;
tic;
%read train image from path
path = '/Users/Serena/Documents/MATLAB/541FINAL/train.txt';
[img_num,imagePath, train_lable] = readText(path);
[train_data] = getData(img_num, imagePath);

%train svm and naive bayes model.
%tunning svm by 'BoxConstraint' and 'KernelScale'
% SVMModel = fitcsvm(train_data',train_lable,'BoxConstraint',1,'KernelScale',1,'KernelFunction','rbf','Standardize',true);
% ScoreSVMModel = fitPosterior(SVMModel,train_data',train_lable);
% %Cross validate the SVM classifier.
% CVSVMModel = crossval(SVMModel);
% classLoss = kfoldLoss(CVSVMModel);

NBModel = fitcnb(train_data',train_lable,'Distribution','normal');%,'Crossval','on'
DecisionTrees = fitctree(train_data',train_lable);

%test
path_t = '/Users/Serena/Documents/MATLAB/541FINAL/test.txt';
[test_img_num,test_imagePath, test_real_lable] = readText(path_t);
[test_data] = getData(test_img_num,test_imagePath);

%classified by svm, knn and naive bayes model.
% SVM_predicted_label = predict(SVMModel,test_data');
% KNN_predicted_lable = getKnn(train_data',train_lable,test_data',4);
NB_predicted_lable = predict(NBModel,test_data');
DT_predicted_lable = predict(DecisionTrees,test_data');

%compute the accuracies of these three models.
% acc_svm = getAccuracy(SVM_predicted_label,test_real_lable);
% acc_knn = getAccuracy(KNN_predicted_lable,test_real_lable);
acc_bayes = getAccuracy(NB_predicted_lable,test_real_lable);
acc_dt = getAccuracy(DT_predicted_lable,test_real_lable);
load handel
sound(y,Fs)
toc;

