close all;
clear;
clc;

% choose an image from the bitmap folder
addpath('data/bitmap');
addpath('helpers');
img_name = 'fool.pbm';

% read the image
img_bin = imread(img_name);
[h, w] = size(img_bin);

% compute the run lengths
runs = runLengths(img_bin);

% compute the symbol probabilities
[huff_symbols, huff_probs] = huff_preprocess(runs);

% compute the Huffman dictionary (Huffman procedure)
dict = huffmandict(huff_symbols, huff_probs);

% encode the run lengths using the computed dictionary
comp = huffmanenco(runs,dict);

save(strcat('data/compressed/', img_name(1:end-4), '.mat'), 'dict', 'comp', 'h');