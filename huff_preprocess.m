function [huff_symbols, huff_probs] = huff_preprocess(runs)
% compute the symbol probabilities
    maximum = max(runs);
    huff_symbols = 0:maximum;
    huff_probs = zeros(1, maximum+1);
    for i = 1:maximum+1
        huff_probs(i) = size(find(runs==(i-1)), 2);
    end
    huff_probs = huff_probs./size(runs, 2);
    null_idxs = find(huff_probs==0);
    huff_probs(null_idxs) = [];
    huff_symbols(null_idxs) = [];
end