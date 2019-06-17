close all; 
clear; 
clc;
addpath('data/png8');
img_name = 'barbara.png';
img = double(imread(img_name));
%img = rgb2gray(img);

[h, w] = size(img);
tot_size = 0;
% encode all the bitplanes
for i = 1:8
	plane = bitget(img,8-i+1);
	runs = runLengths(plane);
    [huff_symbols, huff_probs] = huff_preprocess(runs);

    dict = huffmandict(huff_symbols, huff_probs);
    comp = huffmanenco(runs,dict);
    tot_size = tot_size + getDictSize(dict)/8 + size(comp, 2);
end
gain = h*w*8/tot_size;

tot_size = 0;
% encode the 4 most significant bitplanes
for i = 1:4
	plane = bitget(img,8-i+1);
	runs = runLengths(plane);
    [huff_symbols, huff_probs] = huff_preprocess(runs);

    dict = huffmandict(huff_symbols, huff_probs);
    comp = huffmanenco(runs,dict);
    tot_size = tot_size + getDictSize(dict)/8 + size(comp, 2);
end
gain2 = h*w*8/(tot_size + h*w*4);

info = imfinfo(img_name);
png_size = info.FileSize*8; % FileSize is expressed in bytes
w = info.Width;
h = info.Height;
d = info.BitDepth;
tot_size = w*h*d;
png_gain = tot_size/png_size;

disp(['Gain when encoding all planes: ', num2str(gain)]);
disp(['Gain when encoding the 4 most significant planes: ', num2str(gain2)]);
disp(['Gain when encoding with PNG: ', num2str(png_gain)]);
