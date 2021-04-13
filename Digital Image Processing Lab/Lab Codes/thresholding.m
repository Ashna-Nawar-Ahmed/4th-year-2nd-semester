img=imread('fruits.jpg');
I=rgb2gray(img);
figure;
imshow(I);
[row, col]=size(I);
A=127;
X0=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        if I(i,j)>A
            X0(i,j)= I(i,j)+(I(i,j)*0.5); 
        else
            X0(i,j)= I(i,j)-(I(i,j)*0.25); 
        end    
    end
end
figure;
imshow(X0);