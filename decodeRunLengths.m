function img = decodeRunLengths(runs, h, w)
    img = [];
    curr = 1;
    r = 1;
    while r <= size(runs, 2)
        if runs(r) ~= 0
            img = [img, ones(1, runs(r))];        
        end
        r = r + 1;
        if r <= size(runs, 2)
            img = [img, zeros(1, runs(r))];  
        end
        r = r + 1;
    end
    img = reshape(img, w, h).';   
end