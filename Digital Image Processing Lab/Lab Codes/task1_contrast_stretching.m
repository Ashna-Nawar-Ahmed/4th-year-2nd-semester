I=imread('pollen.jpg');
a=rgb2gray(I);
a=im2double(a);
B=max(a(:));
A=min(a(:));
D=B-A;

M=2^8-1;
[row, col]=size(a);
R=uint8(zeros(row,col));

for i=1:row
   for j=1:col
        R(i,j)=((a(i,j)-A)/D)*M;
   end 
end
% figure;
% imshow(I);
figure;
imshow(a);
figure;
imshow(R);

X=zeros(1,256);
for i=1:row
    for j=1:col
        temp=I(i,j)+1;
        X(temp)=X(temp)+1;
    end
end
Y=zeros(1,256);
for i=1:row
    for j=1:col
        temp=R(i,j)+1;
        Y(temp)=Y(temp)+1;
    end
end
figure;
bar(X);
figure;
bar(Y);


