function[ptCT] = movePC(ptCT,ptUS)
    ptCT = ptrotate(180,0, 0, 0,0,0, ptCT);
    CT_x = ptCT.Location(:,1);
    CT_y = ptCT.Location(:,2);
    CT_z = ptCT.Location(:,3);
    

    CT_px = his_mid(CT_x);
    CT_py = his_mid(CT_y);
    CT_pz = his_mid(CT_z);
    
    US_x = ptUS.Location(:,1);
    US_y = ptUS.Location(:,2);
    US_z = ptUS.Location(:,3);

    US_px = his_mid(US_x);
    US_py = his_mid(US_y);
    US_pz = his_mid(US_z);
    
    ptCT = ptrotate(0 ,0, 0, US_px-CT_px,US_py-CT_py,US_pz-CT_pz, ptCT);
