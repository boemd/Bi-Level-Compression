close all;
clear;
clc;

addpath('data/samples');
addpath('helpers');
img_path = 'ccitt7.pbm';

img_0 = imread(img_path);
imshow(img_0);