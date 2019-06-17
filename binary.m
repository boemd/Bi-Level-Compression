close all;
clear;
clc;

addpath('data/png');
addpath('data/bitmap');
addpath('helpers');
img_name = 'zelda';

img = imread(strcat(img_name, '.png'));
bin = toBinary(img);
%bin = imrotate(bin, 90);
imwrite(bin, strcat('data/bitmap/', img_name, '.pbm'))
imwrite(bin, strcat(img_name, '.png'));
