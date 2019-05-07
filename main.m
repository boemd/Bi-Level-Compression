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


comp_ratio = (h*w)/(size(comp, 2) + getDictSize(dict))
