function [ features ] = getData( img_num, imagePath )
%TRAINIMAGE Summary of this function goes here
%   This function is used to get hog features.
%   Using vlfeat 
    count = 1;
    if img_num > 0 
        for i = 1:img_num 
            image = imread(imagePath{i,1});
            %hog descriptors
            im = im2single(image);
            im = imresize(im, [128 128]);
            cellSize = 16 ;        
            hog = vl_hog(im, cellSize, 'verbose', 'variant', 'dalaltriggs');
            %hog = vl_hog(im, cellSize, 'verbose');
            [m,n,p] = size(hog);
            hog_1d = reshape(hog,m*n*p,1);
            hog_descriptors(:,count) = hog_1d;
            count = count + 1;
        end
    end
%     dog = ones(845,1);
%     notdog = -1 * ones(845,1);
%     train_lable = [dog;notdog];
    features = double(hog_descriptors);

end

% %exam negative sample, then get hard example
% neg_data = train_data(:,846:1690);
% [neg_lable, neg_acc, neg_decValue]=svmpredict(notdog,neg_data',model);
% %add hard examples to train data again
% cnt = 1;
% for i = 1:img_num/2
%     if neg_lable(i) == 1;
%         neg_hog_des(:,cnt) = double(hog_descriptors(:,img_num/2 + i));
%         cnt = cnt+1;
%     end
% end
% [m,n] = size(neg_hog_des);
% neg = -1*ones(n,1);
% train_lable = [train_lable;neg];
% train_data = [train_data,neg_hog_des];
% final_model = svmtrain(train_lable, train_data');