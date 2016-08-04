%1
%I = imread('can_pix.png');
%I = imread('coins_pix.jpg');
I = imread('_DSC1042.jpg');
%I = imread('_DSC1212.jpg');
%I = imread('DSC_4711.jpg');
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
BW = imresize(BW, 0.5,'bilinear');

%2.1
marked = false(size(BW));
[rows,cols] = size(BW);
L = zeros(rows,cols);
marker = 0;

for row = 1 : rows
    for col = 1 : cols
        if BW(row,col) == 0
            marked(row,col) = true; %skip 0s
        elseif marked(row,col)
            continue;
        else
            marker = marker + 1;
            stack = [row col]; %used stack because recursion crashes matlab
            while ~isempty(stack)
                loc = stack(1,:);
                stack(1,:) = [];

                if marked(loc(1),loc(2))
                    continue;
                end
                marked(loc(1),loc(2)) = true;
                L(loc(1),loc(2)) = marker;
                [locs_y, locs_x] = meshgrid(loc(2)-1:loc(2)+1, loc(1)-1:loc(1)+1); %check neighbors
                locs_y = locs_y(:);
                locs_x = locs_x(:);
                out_of_bounds = locs_x < 1 | locs_x > rows | locs_y < 1 | locs_y > cols;
                locs_y(out_of_bounds) = [];
                locs_x(out_of_bounds) = [];
                is_marked = marked(sub2ind([rows cols], locs_x, locs_y));
                locs_y(is_marked) = [];
                locs_x(is_marked) = [];
                is_1 = BW(sub2ind([rows cols], locs_x, locs_y));
                locs_y(~is_1) = [];
                locs_x(~is_1) = [];
                stack = [stack; [locs_x locs_y]]; %add neighbors to stack
            end
        end
    end
end   

imagesc(L);