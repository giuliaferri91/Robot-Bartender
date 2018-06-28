%% TEST 

%% Robot configuration and Graphic Interface to plot precomputed trajectory
    Robot
    load('VodkaOrange.mat')
    load('RumCola.mat')
    load('GinLemon.mat')
    load('BrassMonkey.mat')
    guiRobot

%% test Path EE computed by Artificial Potential Field Algorithm 
    % plot of: 
    % - result of ctraj
    % - result of algorithm APF 
    % - final path after data fitting
    PathCollisionAvoidance(TVodka, TRum, 'Rum', pointsCloud);

%% test Trajectory of Joint with and without Optimization for Collision Avoidance

% [traj_NoOpt,~,~] = trajectory(robot,resetPosition, Treset, TVodka, pointsCloud, 'Vodka');
% [traj_Opt,PathEE,PathEE_Opt] = TrajOpt_CollisionAvoid(robot,resetPosition, Treset, TVodka, pointsCloud, 'Vodka');
load('testJointSpaceTraj.mat')

% plot:

    % 1) inverse kinematics of Path EE with Artificial Potential Field Algorithm 
        figure;
        plot(robot.ikunc(PathEE));
        title('Joint Trajectory result of inverse kinematic')
        xlabel('Time step')
        ylabel('Joints Pose')
        legend('q1','q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8')
        
    % 2) trajectory in joints Space with:
    % - Optimized velocities of joints and use of Damped Least Squares Inverse of Jacobian
    % - Non Optimized for Collision Avoidance in Joints Space
        figure;
        plot(traj_NoOpt);
        title('Joint Trajectory No-Optimized for Collision Avoidance')
        xlabel('Time step')
        ylabel('Joints Pose')
        legend('q1','q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8')
       
    % 3) trajectory in joints Space with:
    % - Optimized velocities of joints and use of Damped Least Squares Inverse of Jacobian
    % - Optimized for Collision Avoidance in Joints Space
        figure;
        plot(traj_Opt);
        title('Joint Trajectory Optimized for Collision Avoidance')
        xlabel('Time step')
        ylabel('Joints Pose')
        legend('q1','q2', 'q3', 'q4', 'q5', 'q6', 'q7', 'q8')
        
    % 4) difference between desired and obtained path EE 
        figure; 
        grid on;
        hold on;
        for i =1:1:size(PathEE,3)
            pd=transl(PathEE(:,:,i));
            p1=plot3(pd(1),pd(2),pd(3),'ro');
        end
        
        for i =1:1:size(PathEE_Opt,3)
            pe=transl(PathEE_Opt(:,:,i));
            p2=plot3(pe(1),pe(2),pe(3),'g*');
        end
        title('Difference between desired and obtained position of End Effector ')
        xlabel('x')
        ylabel('y')
        zlabel('z')
        legend([p1 p2],'Position EE desidered','Position EE Obtained')
        hold off;
        
        figure; 
        grid on;
        subplot(1,2,1)
        plot(tr2rpy(PathEE));
        axis([ 0 50 -pi pi])
        title('Desired orientation of End Effector ')
        xlabel('Time Step')
        ylabel('RPY angles')
        legend('roll des','pitch des','yaw des')
        
        subplot(1,2,2)
        plot(tr2rpy(PathEE_Opt))
        axis([0 50 -pi pi])
        title('Obtained orientation of End Effector ')
        xlabel('Time Step')
        ylabel('RPY angles')
        legend('roll obt','pitch obt','yaw obt')

    % 5) Manipulability traj Opt e No opt for Collision Avoidance 
        figure;
        hold on;
        p1 = plot(robot.maniplty(traj_NoOpt));
        p2 = plot(robot.maniplty(traj_Opt));
        xlabel('Manipulability index')
        title('Manipulability')
        legend([p1 p2],'traj NoOpt','traj Opt')
        hold off;
        
    % 6) robot 
        % plotObj = plotEnv(shapes)
        % robot.plot(robot.ikunc(PathEE))
        % robot.plot(traj_NoOpt)
        % robot.plot(traj_Opt)
        
%% test complete trajectory to cocktail creation 
% [trajGinLemon, GinLemonPlot] = multi_trajectory(robot,resetPosition, Treset, GinLemon, GinLemon_Step, pointsCloud);
% trajGinLemonMix = Mixology(robot,trajGinLemon(end,:),TMix);
% [trajFinal, trajFinalPlot] = multi_trajectory(robot,trajGinLemonMix(end,:), TMix, Final, Final_Step, pointsCloud);
% trajReset = trajConfigurationJoints(robot,trajFinal(end,:),Treset,Treset,resetPosition);

% GinLemonPlot = cat(1,GinLemonPlot, {trajGinLemonMix, '', []});
% GinLemonPlot = cat(1,GinLemonPlot, trajFinalPlot);
% GinLemonPlot = cat(1,GinLemonPlot, {trajReset, '', []});
% plotObj = plotEnv(shapes);
% plotTraj(robot, plotObj,GinLemonPlot);