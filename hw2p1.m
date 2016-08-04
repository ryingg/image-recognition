%1
I = imread('can_pix.png');
I = rgb2gray(I);
I = im2double(I);
[counts,x] = imhist(I);
counts = rot90(counts);
total = numel(I);
level = 0;
sumB = 0;
wB = 0;
maximum = 0.0;
sum1 = sum((0:255).*counts);
for i=1:256
    wB = wB + counts(i);
    if (wB == 0)
        continue;
    end
    wF = total - wB;
    if (wF == 0)
        break;
    end
    sumB = sumB +  (i-1) * counts(i);
    mB = sumB / wB;
    mF = (sum1 - sumB) / wF;
    between = wB * wF * (mB - mF) * (mB - mF);
    if ( between >= maximum )
        level = i/256;
        maximum = between;
    end
end
BW = im2bw(I,level);
imshow(BW)