close all;
clear;
clc;

addpath('data/compressed');
addpath('data/bitmap');
img_name = 'ccit4';

load(strcat(img_name, '.mat'));

dsig = huffmandeco(comp,dict);
img_rec = decodeRunLengths(dsig, h);
img_orig = imread(strcat(img_name, '.pbm'));

mse = immse(int8(img_rec), int8(img_orig));

if mse~=0
    disp('An error occurred');
else
    w = size(img_rec, 2);
    comp_ratio = (h*w)/(size(comp, 2) + getDictSize(dict));
    X = ['Compression Ratio: ',num2str(comp_ratio)];
    disp(X);    

    figure(1)
    subplot(1,2,1), imshow(img_orig)
    title('Original')
    subplot(1,2,2), imshow(img_rec)
    title('Compression')
end

