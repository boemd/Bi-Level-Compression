function runs = runLengths(img_bin)
    [h, w] = size(img_bin);
    r = reshape(img_bin.', 1, []);
    %start with color white, i.e. 1
    runs = [];
    prec = 1;
    count = 0;
    for i = 1:h*w
        if r(i)==prec
            count = count + 1;
        else
            runs = [runs, count];
            count = 1;
        end
        prec = r(i);
    end
    runs = [runs, count];
    if sum(runs) ~= h*w
        runs = [];
    end
end