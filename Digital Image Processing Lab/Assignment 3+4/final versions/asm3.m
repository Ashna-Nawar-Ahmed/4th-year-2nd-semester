%ORIGINAL BINARY IMAGE
f =[0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 1 0 1 0 0;
    0 0 1 0 1 0 0;
    0 0 1 1 1 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0];

[x,y] = size(f);
p = zeros(x, y);

%3X3 DISK STRUCTURE DILATION
w = [0 1 0;
     1 1 1;
     0 1 0];

for s=2:x-1
    for t=2:y-1
        w1 = [f(s-1, t)*w(1,2) f(s, t-1)*w(2,1) f(s,t)*w(2,2) f(s,t+1)*w(2,3) f(s+1,t)*w(3,2)];
        p(s,t) = max(w1);
    end
end

result = p-f;
figure;
subplot(1,2,1);
imshow(f);
title('Given Image');
subplot(1,2,2);
imshow(result);
title('Image We Want');