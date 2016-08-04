%3.3
%car1
C = imread('car1.jpg');
F = imread('cartemplate.jpg');
F=F(625:end,:); %used only wheels/chassis of template
C = im2double(C);
C = imgaussfilt(C);
F = im2double(F);
CM = C - mean(C(:));
F = F - mean(F(:));
F = imrotate(F, -0.2);
F = imresize(F, 0.2);
B = imfilter(CM,F,'conv');
colormap jet;
subplot(1,2,1); imagesc(B);

[rows,cols] = size(B);
[value,index]=sort(B(:),'descend');
max = index(1,1);
[y,x] = ind2sub(size(B),max);
C=C(:,:,[1 1 1]); %convert I to rgb for subplot
subplot(1,2,2); imshow(C);
grect=[175, 145, 522-175, 245-145];
rect=[x-grect(3)/2, y-grect(4)/2, grect(3), grect(4)];
rectangle('Position',rect,'EdgeColor','b');
rectangle('Position',grect,'EdgeColor','r');
area=grect(3)*grect(4);
intersect=rectint(rect,grect)/area; %93.79 percent

%car2
C = imread('car2.jpg');
F = imread('cartemplate.jpg');
F=F(625:end,:); %used only wheels/chassis of template
C = im2double(C);
F = im2double(F);
CM = C - mean(C(:));
F = F - mean(F(:));
F = fliplr(F);
F = imresize(F, 0.261);
B = imfilter(CM,F,'conv');
colormap jet;
subplot(1,2,1); imagesc(B);

[rows,cols] = size(B);
[value,index]=sort(B(:),'descend');
max = index(1,1);
[y,x] = ind2sub(size(B),max);
C=C(:,:,[1 1 1]); %convert I to rgb for subplot
subplot(1,2,2); imshow(C);
grect=[69, 205, 488-69, 357-205];
rect=[x-grect(3)/2, y-grect(4)/2, grect(3), grect(4)];
rectangle('Position',rect,'EdgeColor','b');
rectangle('Position',grect,'EdgeColor','r');
area=grect(3)*grect(4);
intersect=rectint(rect,grect)/area; %89.38 percent

%car3
C = imread('car3.jpg');
F = imread('cartemplate.jpg');
F=F(625:end,:); %used only wheels/chassis of template
C = im2double(C);
F = im2double(F);
CM = C - mean(C(:));
F = F - mean(F(:));
F = imresize(F, 0.1);
B = imfilter(CM,F,'conv');
colormap jet;
subplot(1,2,1); imagesc(B);
B=B(10:end-10,10:end-10); %limited edges of bounding box

[rows,cols] = size(B);
[value,index]=sort(B(:),'descend');
max = index(1,1);
[y,x] = ind2sub(size(B),max);
C=C(:,:,[1 1 1]); %convert I to rgb for subplot
subplot(1,2,2); imshow(C);
grect=[329, 251, 480-329, 345-251];
rect=[x-grect(3)/2, y-grect(4)/2, grect(3), grect(4)];
rectangle('Position',rect,'EdgeColor','b');
rectangle('Position',grect,'EdgeColor','r');
area=grect(3)*grect(4);
intersect=rectint(rect,grect)/area; %79.04 percent