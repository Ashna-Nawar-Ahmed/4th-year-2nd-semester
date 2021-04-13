img1=imread('img_1.jpg');
img2=imread('img_2.jpg');

%TAKING A BLANK IMAGE OF SAME DIMENSIONS AS THE GIVEN IMAGES
blankImage=zeros(size(img2), class(img2));
figure;
imshow(img1);
figure;
imshow(img2);
[rows, cols]=size(blankImage);
eachRowSize=rows/6;
img1LastPos=1;
img2LastPos=eachRowSize-1;
blankImgLastPos=1;
%DIVIDING INTO 6 ROWS AND REPLACING WITH THE TWO IMAGES 
for i=1:6
    x=mod(i,2);
    if x==0
        blankImage(blankImgLastPos:blankImgLastPos+eachRowSize,:,1:3) = img2(img2LastPos:img2LastPos+eachRowSize,:,1:3);
        img2LastPos=img2LastPos+eachRowSize*2;        
    else
        blankImage(blankImgLastPos:blankImgLastPos+eachRowSize,:,1:3) = img1(img1LastPos:img1LastPos+eachRowSize,:,1:3);
        img1LastPos=img1LastPos+eachRowSize*2;
    end 
    blankImgLastPos=blankImgLastPos+eachRowSize;    
end

figure;
imshow(blankImage);

%ROTATING IMAGE 90 DEGREES
[row, col, planes]=size(blankImage);
rotateImage=uint8(zeros(col, row, planes));

for i=1:row
    for j=1:col
        rotateImage(j,i,:)=blankImage(i,j,:);
    end
end
 figure;
 imshow(rotateImage);