%TASK 1: TAKING RGB IMAGE
img=imread('fruits.jpg');
imshow(img);
title('Original image');
im1=img;

%TASK 2: MAKING GRAYSCALE IMAGE
I=rgb2gray(img);
figure;
imshow(I);
title('Grayscale Image');
im2=I;

%TASK 3: CALCULATING AND PLOTTING HISTOGRAM OF GRAYSCALE IMAGE
[row, col]=size(I);
hist1=zeros(1,256);
for i=1:row
   for j=1:col
       temp=I(i,j)+1;
       hist1(temp)=hist1(temp)+1;       
   end 
end
figure;
bar(hist1);
title('Histogram for Grayscale Image');

%TASK 4: NEGATION TRANSFORMATION
X=uint8(zeros(row,col));
for i=1:row
    for j=1:col
        X(i,j)=255-I(i,j);
    end
end
figure;
imshow(X);
im3=X;
title('Negation Image');

%TASK 5: CALCULATING AND PLOTTING HISTOGRAM OF NEGATIVE IMAGE
hist2=zeros(1,256);
for i=1:row
   for j=1:col
       temp=X(i,j)+1;
       hist2(temp)=hist2(temp)+1;       
   end 
end
figure;
bar(hist2);
title('Histogram for Negation Image');

%TASK 6-7: THRESHOLD VALUE INPUT AND THRESHOLDING
prompt = 'Enter value for threshold: ';
A = input(prompt);
%A=127;
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
title(['Thresholded Image, with Threshold=' num2str(A)]);
im4=X0;

%TASK 8: CALCULATING AND PLOTTING HISTOGRAM OF THRESHOLDED IMAGE
hist3=zeros(1,256);
for i=1:row
   for j=1:col
       temp=X0(i,j)+1;
       hist3(temp)=hist3(temp)+1;       
   end 
end
figure;
bar(hist3);
title(['Histogram for Thresholded Image, with Threshold=' num2str(A)]);


%TASK 9: LOG TRANSFORMATION
X=zeros(row,col);
c=1.5;
I1=im2double(I);
for i=1:row
    for j=1:col
        X(i,j)=c*log(I1(i,j)+1);
    end
end
figure;
imshow(X);
title('Log Transformed Image');
im5=X;

%TASK 10: CALCULATING AND PLOTTING HISTOGRAM OF LOG TRANSFORMED IMAGE
hist4=zeros(1,256);
%CONVERTING DOUBLE IMAGE BACK TO 8-BIT-INT
X = uint8(255 * mat2gray(X));
for i=1:row
   for j=1:col
       temp=X(i,j)+1;
       hist4(temp)=hist4(temp)+1;       
   end 
end
figure;
bar(hist4);
title('Histogram for Log Transformed Image');

%TASK 11-12: GAMMA INPUT & GAMMA TRANSFORMATION
X=zeros(row,col);
c=1.5;
prompt = 'Enter value for gamma: ';
gamma = input(prompt);
%gamma=0.6;
X=c*I1.^gamma;
X=im2uint8(X);
figure;
imshow(X);
title(['Gamma Transformed Image, with Gamma=' num2str(gamma)]);
im6=X;


%TASK 13: CALCULATING AND PLOTTING HISTOGRAM OF GAMMA TRANSFORMED IMAGE
hist5=zeros(1,256);
%CONVERTING DOUBLE IMAGE BACK TO 8-BIT-INT
for i=1:row
   for j=1:col
       temp=X(i,j)+1;
       hist5(temp)=hist5(temp)+1;       
   end 
end
figure;
bar(hist5);
title(['Histogram for Gamma Transformed Image, with Gamma=' num2str(gamma)]);

%TASK 14: COMPARING DIFFERENCES
%IMAGES
figure;
subplot(2,3,1);
imshow(im1);
title('Original');
subplot(2,3,2);
imshow(im2);
title('Grayscale');
subplot(2,3,3);
imshow(im3);
title('Negation');
subplot(2,3,4);
imshow(im4);
title('Thresholded');
subplot(2,3,5);
imshow(im5);
title('Log Transformed');
subplot(2,3,6);
imshow(im6);
title('Gamma Transformed');

%HISTOGRAMS
figure;
subplot(2,3,1);
bar(hist1);
title('Histogram for Grayscale Image');
subplot(2,3,2);
bar(hist2);
title('Histogram for Negation Image');
subplot(2,3,3);
bar(hist3);
title('Histogram for Thresholded Image');
subplot(2,3,4);
bar(hist4);
title('Histogram for Log Transformed Image');
subplot(2,3,5);
bar(hist5);
title('Histogram for Gamma Transformed Image');












