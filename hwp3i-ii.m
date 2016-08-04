%3.1
I = imread('toy.png');
F = imread('filter.jpg');
Im = im2double(Im);
Fm = im2double(Fm);
Im = Im - mean(Im(:));
Fm = Fm - mean(Fm(:));
B = imfilter(Im,Fm,'conv');
colormap jet;
subplot(1,2,1); imagesc(B);

[rows,cols] = size(B);
[value,index]=sort(B(:),'descend');
max1 = index(1,1);
max2 = index(2,1);
max3 = index(3,1);
[y1,x1] = ind2sub(size(B),max1);
[y2,x2] = ind2sub(size(B),max2);
[y3,x3] = ind2sub(size(B),max3);
I=I(:,:,[1 1 1]); %convert I to rgb for subplot
subplot(1,2,2); imshow(I);
rect1=[x1-63, y1-63, 127, 127];
rect2=[x2-63, y2-63, 127, 127];
rect3=[x3-63, y3-63, 127, 127];

%3.2
imshow(I);
subplot(1,1,1);
imshow(I);
rectangle('Position',rect1,'EdgeColor','b');
rectangle('Position',rect2,'EdgeColor','b');
rectangle('Position',rect3,'EdgeColor','b');
grect1=[145-63, 178-63, 127, 127];
grect2=[342-63, 82-63, 127, 127];
grect3=[377-63, 256-63, 127, 127];
rectangle('Position',grect1,'EdgeColor','r');
rectangle('Position',grect2,'EdgeColor','r');
rectangle('Position',grect3,'EdgeColor','r');
area=127*127;
intersect1=rectint(rect1,grect1)/area; %84.25 percent
intersect2=rectint(rect2,grect2)/area; %84.25 percent
intersect3=rectint(rect3,grect3)/area; %84.25 percent

