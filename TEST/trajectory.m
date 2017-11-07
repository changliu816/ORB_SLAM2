% plot 3D trajectory
%% Read txt file 
clear 
addpath('Smartphone_Example');
fid = fopen('KeyFrameTrajectory.txt');
data = textscan(fid,'%10.7f%10.7f%10.7f%10.7f%10.7f%10.7f%10.7f%10.7f','CollectOutput',1);
data = data{:};
fid = fclose(fid);
%trajectory x,y,z
tra=data(:,2:4);
tra(:,3)=-tra(:,3);
figure
subplot 121
plot3(tra(:,1),tra(:,2),-tra(:,3),'-r');
title('Local 3D map coordinate')
grid on
%figure
%plot(tra(:,3),tra(:,1),'-r');


%%  trajectory scale
% p1=[0.8707,2.315];
% p2=[1.029,-0.4775];
% d1= norm(p2-p1);
% % trajectory orien
% k1=p2-p1;
% k1=k1(2)/k1(1);
% 
% %% distance
% d2=172.769784;
% %orientation
% a=[-79.948851,40.445827];
% b=[-79.946812,40.445977];
% k2= b-a;
% k2= k2(2)/k2(1);
% 
% % scale factor
% s=d2/d1;

s=61.7700;
traj=[tra(:,1),tra(:,3)]*s;
%plot(traj(:,1),traj(:,2),'-r');
%%
llo=[40.445398, -79.947072]; %GPS of the star point(the first data of tra)
traj2=[traj,zeros(length(traj),1)];
% check the third column.
%Angular direction of flat Earth x-axis (degrees clockwise from north), 
%which is the angle in degrees used for converting flat Earth x and y coordinates 
%to North and East coordinates.
lla1 = flat2lla(traj2, llo,-5.9598, 0);  
lla1(:,3)=[];
subplot 122
plot(lla1(:,2),lla1(:,1),'-r');
title('Real world 2D map coordinate')
grid on
