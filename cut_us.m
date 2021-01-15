function [ptout] = cut_us(file,FIGURE)
    ptUS = pcread(file);
    ptout = ptUS;
    if FIGURE
        figure;
        pcshow(ptout,'MarkerSize',20);
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
    end
end


