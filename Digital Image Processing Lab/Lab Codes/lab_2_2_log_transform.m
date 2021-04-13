%LOG TRANSFORMATION
I=imread('cameraman.png');
figure;
imshow(I);
I=im2double(I);
[row,col]=size(I);
X=zeros(row,col);
c=1;
for i=1:row
    for j=1:col
        X(i,j)=c*log(I(i,j)+1);
    end
end
figure;
imshow(X);
figure;
plot(I,X,'.-b');