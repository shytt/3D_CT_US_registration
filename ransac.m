function[ratio] = ransac(data, inlier)
iter = 1000; 

%%% 绘制数据点
 figure;plot3(data(:,1),data(:,2),data(:,3),'o');hold on; % 显示数据点
 number = size(data,1); % 总点数
 bestParameter1=0; bestParameter2=0; bestParameter3=0; % 最佳匹配的参数
 sigma = 5;
 pretotal=0;     %符合拟合模型的数据的个数

for i=1:iter
 %%% 随机选择三个点
     idx = randperm(number,3); 
     sample = data(idx,:); 

     %%%拟合直线方程 z=ax+by+c
     plane = zeros(1,3);
     x = sample(1, :);
     y = sample(2, :);
     z = sample(3, :);

     a = (x(3)*(y(2)-z(2))-y(3)*(x(2)-z(2))-(y(2)-z(2))*z(3)+(x(2)-z(2))*z(3))/((x(1)-z(1))*(y(2)-z(2))-(y(1)-z(1))*(x(2)-z(2)));
     b = (x(3)-(x(1)-z(1))*a-z(3))/(x(2)-z(2));
     c=z(3)-a*z(1)-b*z(2);
     
     plane = [a b -1 c];

     mask=abs(plane*[data.'; ones(1,size(data,1))]);    %求每个数据到拟合平面的距离
     total=sum(mask<sigma);              %计算数据距离平面小于一定阈值的数据的个数

     if total > (inlier*number) && total>pretotal            %找到符合拟合平面数据最多的拟合平面
         pretotal=total;
         bestplane=plane;          %找到最好的拟合平面
     end  
 end
 

 
 %%% 绘制最佳匹配平面
 bestParameter1 = bestplane(1);
 bestParameter2 = bestplane(2);
 bestParameter3 = bestplane(4);
 xAxis = min(data(1,:)):max(data(1,:));
 yAxis = min(data(2,:)):max(data(2,:));
 [x,y] = meshgrid(xAxis, yAxis);
 z = bestParameter1 * x + bestParameter2 * y + bestParameter3;
 surf(x, y, z);
 title(['bestPlane:  z =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2),'y + ',num2str(bestParameter3)]);
 ratio = pretotal/number;
end