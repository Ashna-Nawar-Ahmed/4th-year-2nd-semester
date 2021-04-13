%NEGATION TRANSFORMATION
I=imread('cameraman.png');
figure;
imshow(I);
[row, col]=size(I);
X=uint8(zeros(row,col));

for i=1:row
    for j=1:col
        X(i,j)=255-I(i,j);
    end
end
 figure;
 imshow(X);
% Y = 255 - I;
% figure;
% imshow(Y);

%HISTOGRAM PLOTTING
X=zeros(1,256);
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
ylabel('frequency')
