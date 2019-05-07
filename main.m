close all;
clear;
clc;

addpath('data/bitmap');
addpath('helpers');
img_path = 'ccit1.pbm';

img_bin = imread(img_path);
%imshow(img_bin)
%img_bin = toBinary(img_0);

%{
img_bin = logical([0,0,0,0,0;
           1,1,1,1,1;
           0,0,0,0,0;
           1,1,1,1,1;
           0,0,1,0,0;]); %lr: 5,5,5,5,2,1,2,2,1,2
%}
       
[h, w] = size(img_bin);
runs = runLengths(img_bin);
dec = decodeRunLengths(runs, h, w);
%imshow(dec)

[huff_symbols, huff_probs] = huff_preprocess(runs);

dict = huffmandict(huff_symbols, huff_probs);
comp = huffmanenco(runs,dict);
dsig = huffmandeco(comp,dict);
img_rec = decodeRunLengths(dsig, h, w);
mse = immse(int8(img_rec), int8(img_bin));

if mse~=0
    disp('An error occurred');
else
    comp_ratio = (h*w)/(size(comp, 2) + getDictSize(dict));
    X = ['Compression Ratio: ',num2str(comp_ratio)];
    disp(X);    

    figure(1)
    subplot(1,2,1), imshow(img_bin)
    title('Original')
    subplot(1,2,2), imshow(img_rec)
    title('Compression')
end
