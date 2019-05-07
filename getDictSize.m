function sz = getDictSize(dict)
    sz = 0;
    cwrd_max = 0;
    rl_max = 0;
    for i = 1: size(dict, 1)
       rl = cell2mat(dict(i, 1));
       cwrd = cell2mat(dict(i,2));
       
       sz = sz + size(cwrd, 2);
       
       if rl > rl_max
           rl_max = rl;
       end
       if size(cwrd, 2) > cwrd_max
           cwrd_max = size(cwrd, 2);
       end
    end
    M = ceil(log2(rl_max));
    sz = sz + M*size(dict, 1);
end