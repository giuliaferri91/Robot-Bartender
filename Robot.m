startup_rvc;
close all
clear L

deg = pi/180;
T = [rpy2r(0, 0, 0) [0.5; 0; 2];
    0 0 0 1];
% create the base
r1 = SerialLink( [0 0 0 -pi/2 1], 'base', T); 

L(1) = Revolute('d', 0, 'a', 0 ,'alpha', -pi/2, ...
    'qlim', [-70 250]*deg );

L(2) = Revolute('d', 0, 'a', 0, 'alpha', pi/2, ...
    'qlim', [-360 360]*deg );

L(3) = Revolute('d', 0, 'a', 0.7, 'alpha', 0, ...
    'qlim', [-225 250]*deg );

L(4) = Revolute('d', 0, 'a', 0.0203, 'alpha', -pi/2,  ...
    'qlim', [-235 60]*deg );

L(5) = Revolute('d', 0.7, 'a', 0, 'alpha', pi/2,  ...
    'qlim', [-360 360]*deg);

L(6) = Revolute('d', 0, 'a', 0, 'alpha', -pi/2,  ...
    'qlim', [-360 360]*deg );

L(7) = Revolute('d', 0, 'a', 0, 'alpha', pi/2,  ...
    'qlim', [-180 180]*deg );

r2 = SerialLink(L, 'name', 'robot');


% compose the two robots
Xmn = -2.5;
Xmx = 2.5;
Ymn = -3;
Ymx = 3;
Zmn = -2.5;
Zmx = 2.5;
robot = SerialLink( [r1, r2], 'name', 'robot', ...
    'plotopt',{'workspace',[Xmn,Xmx,Ymn,Ymx,Zmn,Zmx], ...
    'scale',0.5, 'linkcolor', 'g','noshadow','nobase','lightpos',[5 5 10], 'jointdiam',2});

% set the range for the prismatic links
robot.links(1).qlim = [-1.5 0.2];
clear L

resetPosition = [-0.2870  0  1.5708  2.3443 -3.9270 3.1416 1.5708 1.5708];
Treset = robot.fkine(resetPosition); % Forward kinematics per avere trasformation omogenea posizione iniziale
environment;
createReceipt;



