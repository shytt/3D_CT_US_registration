ptCT = pcread('../../PointCloud/20201222.ply');
CT_x = ptCT.Location(:,1);
CT_y = ptCT.Location(:,2);
CT_z = ptCT.Location(:,3);

data = [CT_x, CT_y, CT_z];