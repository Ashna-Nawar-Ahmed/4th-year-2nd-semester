%STEP 1: TAKE INPUT
img = rgb2gray(imread('input.png'));
I = im2double(img);
fig_a = I;

%STEP 2: 3X3 POSITIVE LAPLACIAN FILTER
kernel_laplace = [0 1 0; 1 -4 1; 0 1 0];
[row, col] = size(I);
fig_b = zeros(row,col);
padded_img = zeros(row+2,col+2);
padded_img(2:2+row-1,2:2+col-1) = I;
for i=2:2+row-1
    for j= 2:2+col-1
        temp = padded_img(i-1:i+1,j-1:j+1).* kernel_laplace;
        fig_b(i-1,j-1) = sum(temp(:));
    end
end


%STEP 3: ENHANCED LAPLACIAN
fig_c = fig_a - fig_b;

%STEP 4: SOBEL FILTER
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
fig_d = zeros(row,col); 
for i=2:2+row-1
    for j= 2:2+col-1
        temp = padded_img(i-1:i+1,j-1:j+1).* sobel_x;
        temp_x = sum(temp(:));
        temp = padded_img(i-1:i+1,j-1:j+1).* sobel_y;
        temp_y = sum(temp(:));
        fig_d(i-1,j-1) = sqrt(temp_x.^2 + temp_y.^2);
    end
end


%STEP 5: 5x5 MEAN FILTER
padded_img = zeros(row+4,col+4);
padded_img(3:3+row-1,3:3+col-1) = fig_d;
fig_e =  zeros(row,col);
for i=3:3+row-1
    for j= 3: 3+col-1
        temp = padded_img(i-2:i+2,j-2:j+2);
        fig_e(i-2,j-2) = mean(temp(:));
    end
end

%STEP 6: PRODUCT OF C AND E
fig_f = fig_c.*fig_e;

%STEP 7: SUM OF A AND F
fig_g = fig_a + fig_f;

%STEP 8: POWER LAW TRANSFORM
X=zeros(row,col);
c=1;
gamma=0.5;
for i=1:row
    for j=1:col
        X(i,j)=c*(I(i,j).^gamma);
    end
end
fig_H=X;

% PLOTTING EVERYTHING
figure;
subplot(2,4,1);imshow(fig_a);title('Fig A: Original Image');
subplot(2,4,2);imshow(fig_b, []);title('Fig B: Laplacian Filtered Image');
subplot(2,4,3);imshow(fig_c);title('Fig C: Laplacian Enhanced Image');
subplot(2,4,4);imshow(fig_d);title('Fig D: Sobel Filtered Image');
subplot(2,4,5);imshow(fig_e);title('Fig E: Average Filtered Image');
subplot(2,4,6);imshow(fig_f);title('Fig F: C*E');
subplot(2,4,7);imshow(fig_g);title('Fig G: A+F');
subplot(2,4,8);imshow(fig_H);title('Fig H: Power Law Transformed Image');