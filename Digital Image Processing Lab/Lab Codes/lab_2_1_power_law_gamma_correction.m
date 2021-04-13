%POWER-LAW TRANSFORMATION: CORRECTING GAMMA
I=imread('cameraman.png');
figure;
imshow(I);
I=im2double(I);
[row,col]=size(I);
X=zeros(row,col);
c=1;
gamma=3;
for i=1:row
    for j=1:col
        X(i,j)=c*(I(i,j).^gamma);
    end
end
figure;
imshow(X);
figure;
plot(I,X,'.-r');