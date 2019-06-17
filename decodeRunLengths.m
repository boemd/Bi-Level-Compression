function img = decodeRunLengths(runs, h)
    img = [];
    r = 1;
    % in each iteration two run lengths are decoded
    while r <= size(runs, 2)
        if runs(r) ~= 0
            % decode a run of whites
            img = [img, ones(1, runs(r))];        
        end
        r = r + 1;
        if r <= size(runs, 2)
            % decode a run of blacks
            img = [img, zeros(1, runs(r))];  
        end
        r = r + 1;
    end
    % reshape to the original shape
    img = reshape(img, [], h).';
    img = logical(img);
end