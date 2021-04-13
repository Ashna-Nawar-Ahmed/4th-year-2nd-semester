%HISTOGRAM PLOTTING
I=imread('peppers_color.jpg');
figure;
imshow(I);
a=rgb2gray(I);
I=a;
figure;
imshow(a);
[row, col]=size(I);
X=uint8(zeros(row,col));
%X=zeros(1,256);
for i=1:row
    for j=1:col
        temp=I(i,j)+1;
        X(temp)=X(temp)+1;
    end
end
figure;
bar(X);
title('Hist plot')
xlabel('0  to 255 pixel values')