% function avgFilter()
%     S = rgb2gray(imread('G:\CSE 4228\DIP\Lab 04\Noise Filtering-Images\coloredChips.png'));
%     R = S;
%     [row, col] = size(S);
%     
%     S = imnoise(S, 'salt & pepper', 0.02);
%     
%     for i = 1:row-4
%        for j = 1:col-4 
%            
%            N = S(i:i+4, j:j+4);
%            t = mean(N(:));
%            %t = min(N(:));
%            %t = max(N(:));
%            
%            R(i,j) = t;
%            
%        end
%     end
% 
%     figure; imshow(S);
%     figure; imshow(R);
%     figure; imshow(abs(R - S), [0 1])
%     
% end


% S = rgb2gray(imread('coloredChips.png'));
% R = S;
% [row, col] = size(S);
% 
% S = imnoise(S, 'salt & pepper', 0.02);
% N=zeros(3,3);
% for i = 1:row-3
%    for j = 1:col-3 
% 
%        if(i<=1||j<=1)
%            N = S(i:i+1, j:j+1);
%        else
%            N = S(i-1:i+1, j-1:j+1);
%        end
% 
%        t = mean(N(:));
%        %t = min(N(:));
%        %t = max(N(:));
% 
%        R(i,j) = t;
%        disp(N);
%        N=zeros(3,3);
%        
%    end
% end
% 
% figure; imshow(S);
% figure; imshow(R);
% figure; imshow(abs(R - S), [0 1]);


%        if(i==1&&j>1)
%            disp('here');
%            N(i+1:i+2, j:j+2) = S(i:i+1, j-1:j+1);
%        elseif(i>1&&j==1)
%            N(i:i+2, j+1:j+2) = S(i-1:i+1, j:j+1);
%        elseif(i>1&&j>1)           
%            N(1:3,1:3) = S(i-1:i+1, j-1:j+1);
%        end
