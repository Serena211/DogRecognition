function [ accuracy ] = getAccuracy( predicted_lable, real_lable )
%This function is used to get the accuracy of classifaction.
%   Detailed explanation goes here
    [num,~] = size(predicted_lable);
    count = 0;
    for i = 1:num
        if predicted_lable(i) == real_lable(i)
            count = count + 1;
        end
    end
    accuracy = count / num;

end

