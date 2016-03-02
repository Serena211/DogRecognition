function [ img_num, imagePath, class_lable ] = readText( textPath )
%READTEXT Summary of this function goes here
%   This function is used for reading the .txt file and conver it to
%   matrix.
    f = fopen(textPath,'rt'); %read .txt
    C = textscan(f, '%s %d');
    class = {'imagePath','class'};
    A = cell2struct(C, class, 2);
    img_num = size(A.imagePath,1);
    % imagePath = zeros(m,1);
    % class_lable = zeros(m,1);
    for i = 1:img_num
        imagePath(i) = A.imagePath(i);
        class_lable(i) = A.class(i);
    end
    imagePath = imagePath';
    class_lable = double(class_lable)';
    fclose(f);

end

