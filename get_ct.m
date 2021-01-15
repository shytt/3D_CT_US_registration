function [ptout] = get_ct(file,FIGURE)
    ptCT = pcread(file);

    A = [0.4 0 0 0;0 0.4 0 0;0 0 0.4 0;0 0 0 1];
    tformManual = affine3d(A);
    ctCloudTformed = pctransform(ptCT,tformManual);
    
    ptout = pcdownsample(ctCloudTformed,'gridAverage',1);
    if FIGURE
        figure;
        pcshow(ptout,'MarkerSize',20);
        xlabel('X');
        ylabel('Y');
        zlabel('Z');
    end
end