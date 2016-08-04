function label(row,col)
set(0,'RecursionLimit',1000)
global visited
global B
global BW
global marker
global cols
global rows
visited(row,col) = true; %visited
B(row,col) = marker; %mark with marker

%// Look at the 8 neighbouring locations
for y = row-1 : row+1
    for x = col-1 : col+1
        if x < 1 || x > rows || y < 1 || y > cols || x==col ||y==row
            break;
        elseif BW(y,x) == 1 && visited(y,x) == false
            label(row,col);
        end
    end
end

end