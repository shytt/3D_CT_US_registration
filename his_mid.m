function[midpoint] = his_mid(his)

    [x,edges] = histcounts(his, 'Normalization', 'cdf');
    position = find(x>=0.5);
    %print(position);
    midpoint = edges(position(1));
end