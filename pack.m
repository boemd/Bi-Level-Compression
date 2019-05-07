function pkt = pack(dict, comp, h, w)
    pkt = [];
    pkt = [pkt, dec2base(h, 2, 16)];
    pkt = [pkt, dec2base(w, 2, 16)];
    n_max = 0;
    l_max = 0;
    for i = 1: size(dict, 1)
       pkt = [pkt, dec2base(cell2mat(dict(i,1)), 2, Q)]; 
       
    end
end