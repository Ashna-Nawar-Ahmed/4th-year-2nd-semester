%MATLAB code for dilation,erosion,opening and closing of image
clc;
clear all;
close all;

f=(imread('concoin.png'));
f = rgb2gray(f);
subplot(2,3,1);
imshow(f);
title('Original image');

f = imbinarize(f);
subplot(2,3,2);
imshow(f);
title('Binarized image');

[x,y]=size(f);
p=zeros(x,y);
p2=zeros(x,y);
p12=zeros(x,y);
p13=zeros(x,y);

%Dilation
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:x-1
    for t=2:y-1
        w1=[f(s-1,t-1)*w(1,1) f(s-1,t)*w(1,2) f(s-1,t+1)*w(1,3) f(s,t-1)*w(2,1) f(s,t)*w(2,2) f(s,t+1)*w(2,3) f(s+1,t-1)*w(3,1) f(s+1,t)*w(3,2) f(s+1,t+1)*w(3,3)];
        p(s,t)=max(w1);
    end
end
subplot(2,3,3);
imshow(p);
title('Dilated image');

%erosion
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:x-1
    for t=2:y-1
        w12=[f(s-1,t-1)*w(1) f(s-1,t)*w(2) f(s-1,t+1)*w(3) f(s,t-1)*w(4) f(s,t)*w(5) f(s,t+1)*w(6) f(s+1,t-1)*w(7) f(s+1,t)*w(8) f(s+1,t+1)*w(9)];
        p2(s,t)=min(w12);
    end
end
subplot(2,3,4);
imshow(p2);
title('Eroded image');

%Opening of image
[m,n]=size(p2);
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:m-1
    for t=2:n-1
        w13=[p2(s-1,t-1)*w(1) p2(s-1,t)*w(2) p2(s-1,t+1)*w(3) p2(s,t-1)*w(4) p2(s,t)*w(5) p2(s,t+1)*w(6) p2(s+1,t-1)*w(7) p2(s+1,t)*w(8) p2(s+1,t+1)*w(9)];
        p12(s,t)=max(w13);
    end
end
subplot(2,3,5);
imshow(p12);
title('opening of image');

%Closing of image

[r,c]=size(p);
w=[1 1 1; 1 1 1; 1 1 1];
for s=2:r-1
    for t=2:c-1
        w14=[p(s-1,t-1)*w(1) p(s-1,t)*w(2) p(s-1,t+1)*w(3) p(s,t-1)*w(4) p(s,t)*w(5) p(s,t+1)*w(6) p(s+1,t-1)*w(7) p(s+1,t)*w(8) p(s+1,t+1)*w(9)];
        p13(s,t)=min(w14);
    end
end
subplot(2,3,6);
imshow(p13);
title('Closing of image');




