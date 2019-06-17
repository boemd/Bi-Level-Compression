close all;
clear;
clc;

% choose an image from the compressed ones
addpath('data/compressed');
addpath('data/bitmap');
addpath('helpers');
img_name = 'zelda';

% read the compressed data
load(strcat(img_name, '.mat'));
comp = comp;  % compressed image
dict = dict;  % Huffman dictionary
h = h;        % height of the original image


% decode the image
dsig = huffmandeco(comp,dict);
img_rec = decodeRunLengths(dsig, h);

% read the original image
img_orig = imread(strcat(img_name, '.pbm'));

% compute the MSE between the original and the reconstruction
mse = immse(int8(img_rec), int8(img_orig));

if mse~=0
    % lossy compression
    disp('An error occurred');
else
    % lossless compression
    w = size(img_rec, 2);                                   % width of the image
    sz = ceil((size(comp, 2) + getDictSize(dict))/8);       % size of the compressed image
    comp_ratio = (h*w)/(size(comp, 2) + getDictSize(dict)); % compression ratio
    space_sav = 1 - 1/comp_ratio;                           % space savings
    
    disp(['Compression Ratio: ', num2str(comp_ratio)]);
    disp(['Space Savings: ', num2str(space_sav)]);
    disp(['Entropy of the image: ', num2str(H(img_orig))]);
    disp(['Size before compression: ', num2str(h*w/8), ' Bytes.']);
    disp(['Size after compression: ', num2str(sz), ' Bytes.']);
    disp(['2^-NH(X): ', num2str(2.^(-H(img_orig)))]);
    disp(['Compression Ratio: ', num2str(comp_ratio)]);
   
    figure(1)
    subplot(1,2,1), imshow(img_orig)
    title('Original')
    subplot(1,2,2), imshow(img_rec)
    title('Compression')
end

