%written by Xinjie Yao
%For demo usage 
%ELEC4010MMECH4000J Project#1
%Apr 2nd 2019
%% IMPORTANT: Please comment irrelevant sections to run tasks individually
%% Clear all graphs
clc, close all;
%% Task1 Baxter Forward Kinematics
% function [pos,joint_plot] = fk(theta1,theta2,theta3,theta4,theta5,theta6,theta7,plot)
clc, close all;
figure;
[pos,joint_plot]=fk(-85.9068, 34.5294, -24.9013, 105.4860, 25.2009, 118.3710,0,true);


%% Task2 Baxter Worksapce
%function [x,y,z] = ws(num,plot)
clc, close all;
figure;
[x,y,z] = ws(4,true);


%% Task3 Baxter Inverse Kinematics
% function [sol,final,joint_plot]=ik(pos,iksolver)
clc, close all;
[sol,final,joint_plot]=ik([50,45,70],true);


 %% Task4 Application of Inverse Kinematics
 %function []=write()
 clc, close all;
 figure;
 write();


