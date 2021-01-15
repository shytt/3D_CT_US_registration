function [ptout] = ptrotate(dx,dy,dz,tx,ty,tz,ptin)
    c1 = cosd(dy);
    c2 = cosd(dx);
    c3 = cosd(dz);
    s1 = sind(dy);
    s2 = sind(dx);
    s3 = sind(dz);
    tr = [c1*c3+s1*s2*s3 c3*s1*s2-c1*s3 c2*s1 0;
          c2*s3          c2*c3 -s2      0;
          c1*s2*s3-s1*c3 s1*s3+c1*c3*s2 c1*c2 0;
          tx             ty             tz    1];
    tf = affine3d(tr);
    ptout = pctransform(ptin,tf);