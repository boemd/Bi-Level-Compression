close all;
clear;
clc;

h = load('dict.mat');
dict = h.dict;

cwrd_max = 0;
rl_max = 0;
for i = 1: size(dict, 1)
   rl = cell2mat(dict(i, 1));
   cwrd = cell2mat(dict(i,2));
   if rl > rl_max
       rl_max = rl;
   end
   if size(cwrd, 2) > cwrd_max
       cwrd_max = size(cwrd, 2);
   end
end
M = ceil(log2(rl_max));
N = cwrd_max;
rl = dec2base(cell2mat(dict(45, 1)), 2, M); 
cw = [zeros(1, N - length(cell2mat(dict(45, 2)))), cell2mat(dict(45, 2))];