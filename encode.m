close all;
clear;
clc;

addpath('data/bitmap');
addpath('helpers');
img_name = 'ccit4.pbm';

img_bin = imread(img_name);
[h, w] = size(img_bin);
runs = runLengths(img_bin);
[huff_symbols, huff_probs] = huff_preprocess(runs);

dict = huffmandict(huff_symbols, huff_probs);
comp = huffmanenco(runs,dict);

save(strcat('data/compressed/', img_name(1:end-4), '.mat'), 'dict', 'comp', 'h');