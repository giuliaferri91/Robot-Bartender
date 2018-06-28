function [Mix_traj] = Mixology(robot, qi, TMix)
    qMixDown = [-0.2797   -0.0537    1.4533    1.5828    0.2299    0.0524    1.5603    1.4522]; 
    j = 5; % joints to move for mix 
    [Mix_traj,~,~] = trajConfigurationJoints(robot, qi, TMix,TMix,qMixDown);
    qMixDown = Mix_traj(end,:);
    qMixUp = qMixDown+[0 0 0 0 0.3 0 0 0];
    for i = 1:1:3
       %from down to up
       step = qMixDown(1,j);
       while(step < qMixUp(1,j))
           step = step + 0.5/10; % in 10 steps
           Mix_traj = cat(1, Mix_traj, horzcat(qMixDown(1,1:j-1), step, qMixDown(1,j+1:end)));
       end
       %from up to down
       step = qMixUp(1,j);
       while(step > qMixDown(1,j))
           step = step - 0.5/10; % in 10 steps
           Mix_traj = cat(1, Mix_traj, horzcat(qMixUp(1,1:j-1), step, qMixUp(1,j+1:end)));
       end
    end
end
