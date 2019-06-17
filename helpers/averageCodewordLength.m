function avg = averageCodewordLength(dict)
    avg = 0;
    for i = 1: size(dict, 1)
        cwrd = cell2mat(dict(i,2));
        avg = avg + size(cwrd, 2)./cell2mat(dict(i, 1)) ;
    end
    avg = avg / size(dict, 1);
end