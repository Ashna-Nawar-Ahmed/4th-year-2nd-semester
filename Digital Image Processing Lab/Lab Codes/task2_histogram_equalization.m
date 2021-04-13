I=imread('cameraman.png');
%a=rgb2gray(I);
[row, col]=size(I);
n=row*col;
M=2^8-1;
hist1=zeros(1,256);

%HISTOGRAM
for i=1:row
   for j=1:col
       temp=I(i,j)+1;
       hist1(temp)=hist1(temp)+1;       
   end 
end

%NORMALIZING HISTOGRAM
PDF=zeros(1,256);
for i=1:256
   PDF(i)=hist1(i)/n;
end

%CUMULATIVE SUMMATION
CDF=zeros(1,256);
CDF(1)=PDF(1);
for i=2:256
   CDF(i)=CDF(i-1)+PDF(i);
end

%HISTOGRAM EQUALIZATION
Sk=zeros(1,256);
for i=1:256
   Sk(i)=255*CDF(i);
end

%ROUNDING TO NEAREST INTENSITY LEVEL
new_Sk=round(Sk);
new_img=uint8(zeros(row,col));
for i=1:row
   for j=1:col
       temp=I(i,j)+1;
       new_img(i,j)=new_Sk(temp);
        %hist1(temp)=hist1(temp)+1;       
   end 
end

figure;
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(new_img);

figure;
subplot(1,2,1);
bar(hist1);
subplot(1,2,2);
bar(new_img);
