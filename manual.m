usROI = cut_us('../../PointCloud/20201223_left.ply',false);
ctROI = get_ct('../../PointCloud/20201222.ply',false);


uss = pcdownsample(usROI,'gridAverage',2);
pointscolor=uint8(zeros(uss.Count,3));
pointscolor(:,1)=0;
pointscolor(:,2)=255*0.7;
pointscolor(:,3)=0;
uss.Color=pointscolor;
% 
% subplot(2,2,1); 
% pcshow(uss,'MarkerSize',20);
% xlabel('X');ylabel('Y');zlabel('Z');view([315,30]);
% title('Fixed US model');


ctt = pcdownsample(ctROI,'gridAverage',2);
pointscolor=uint8(zeros(ctt.Count,3));
pointscolor(:,1)=255*0.7;
pointscolor(:,2)=0;
pointscolor(:,3)=255*0.7;
ctt.Color=pointscolor;

% subplot(2,2,2); 
% pcshow(ctt,'MarkerSize',20);
% xlabel('X');ylabel('Y');zlabel('Z');view([315,30]);
% title('Transformed CT model');

ctROI = movePC(ctROI,usROI);
[tforms1,movingReg,rmse1] = pcregistericp(ctROI,usROI,'InlierRatio',0.8);
figure;
pcshowpair(movingReg,usROI,'MarkerSize',10);
xlabel('X');ylabel('Y');zlabel('Z');view([225,30]);
title('US data from left');

roi_us =  [movingReg.XLimits(1) movingReg.XLimits(2) movingReg.YLimits(1) ...
    movingReg.YLimits(2) movingReg.ZLimits(1) movingReg.ZLimits(2)];
indices = findPointsInROI(usROI,roi_us);
usROI = select(usROI,indices);


%[tforms2,movingReg,rmse2] = pcregistericp(movingReg,usROI,'InlierRatio',0.8);

% 
% subplot(2,2,3); 
figure;
pcshowpair(movingReg,usROI,'MarkerSize',10);
xlabel('X');ylabel('Y');zlabel('Z');view([225,30]);
title('US data from left');



cttt = pcdownsample(movingReg,'gridAverage',2);
pointscolor=uint8(zeros(cttt.Count,3));
pointscolor(:,1)=255*0.7;
pointscolor(:,2)=0;
pointscolor(:,3)=255*0.7;
cttt.Color=pointscolor;

% subplot(2,2,4); 
% 
% pcshow(cttt,'MarkerSize',20);
% xlabel('X');ylabel('Y');zlabel('Z');view([315,30]);
% title('Registered model');
