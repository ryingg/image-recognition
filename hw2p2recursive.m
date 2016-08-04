%1
I = imread('can_pix.png');
I = rgb2gray(I);
I = im2double(I);
[counts,x] = imhist(I);
histogramCounts = rot90(counts);
total = numel(I);
level = 0;
sumB = 0;
wB = 0;
maximum = 0.0;
sum1 = sum((0:255).*histogramCounts);
for ii=1:256
    wB = wB + histogramCounts(ii);
    if (wB == 0)
        continue;
    end
    wF = total - wB;
    if (wF == 0)
        break;
    end
    sumB = sumB +  (ii-1) * histogramCounts(ii);
    mB = sumB / wB;
    mF = (sum1 - sumB) / wF;
    between = wB * wF * (mB - mF) * (mB - mF);
    if ( between >= maximum )
        level = ii/256;
        maximum = between;
    end
end
BW = im2bw(I,level);

%2
[L,num] = bwlabel(BW);
imagesc(L);

%// Step #1
global visited
global B
global marker
global cols
global rows
visited = false(size(BW));
[rows,cols] = size(BW);
B = zeros(rows,cols);
marker = 0;

%// For each location in your matrix...
for row = 1 : rows
    for col = 1 : cols
        if BW(row,col) == 1 && visited(row,col) == false
            marker = marker+1;
            label(row,col);
    end
end   

imagesc(B);