function img = decodeRunLengths(runs, h)
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
    img = reshape(img, [], h).';
    img = logical(img);
end