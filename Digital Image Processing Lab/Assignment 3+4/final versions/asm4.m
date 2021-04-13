S = rgb2gray(imread('vegetables.jpg'));
R = S;
[row, col] = size(S);
N=zeros(3,3);
prompt = 'Enter value for sigma: ';
sigma = input(prompt);
% sigma=1.5;

%3X3 GAUSSIAN KERNEL
x=[-1,0,1;-1,0,1;-1,0,1];
y=[-1,-1,-1;0,0,0;1,1,1];

%GAUSSIAN FORMULA
m=-(x.^2+y.^2)/(2*sigma*sigma);
kernel=(1/(2*pi*sigma*sigma))*exp(m);

for i = 1:row
   for j = 1:col 
       
       %CORNER CASES
       if(i==1)
          if(j==1)
              N(2:3,2:3)=S(i:i+1,j:j+1);
          elseif(j==col)
              N(2:3,1:2)=S(i:i+1,j-1:j);
          else
              N(2:3,1:3)=S(i:i+1,j-1:j+1);
          end
       elseif(i==row)
           if(j==1)
              N(1:2,2:3)=S(i-1:i,j:j+1);
          elseif(j==col)
              N(1:2,1:2)=S(i-1:i,j-1:j);
          else
              N(1:2,1:3)=S(i-1:i,j-1:j+1);
           end
       elseif(j==1)
           if(i>1&&i<row)
               N(1:3,2:3)=S(i-1:i+1,j:j+1);               
           end
       elseif(j==col)
           if(i>1&&i<row)
               N(1:3,1:2)=S(i-1:i+1,j-1:j);               
           end 
       %MIDDLE CASES    
       elseif((i>1&&i<row)&&(j>1&&j<col))
           N(1:3,1:3)=S(i-1:i+1,j-1:j+1);
       end

       val=kernel.*N;
       t = sum(sum(val));
       R(i,j) = t;
       N=zeros(3,3);
       
   end
end

figure; 
subplot(1,2,1);imshow(S);title('Original Image');
subplot(1,2,2);imshow(R);title(['Filtered Image with 3x3 kernel, with sigma=' num2str(sigma)]);
