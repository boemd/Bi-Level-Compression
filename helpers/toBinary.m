function out = toBinary(img)
    [h, w, d] = size(img);
    if (d==3)
        img = rgb2gray(img);
    end
    out = zeros(h, w);
    idxs = find(img>=128);
    out(idxs)=1;
end