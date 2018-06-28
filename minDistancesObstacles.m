function [W] = minDistancesObstacles(robot, q, pointsCloud, Goal)
    n_obstacles = size(pointsCloud,1);
    pointsJoints = getPositionJoints(robot, q);
    W = zeros(robot.n,1);
    for i = 1:1:robot.n %points of each joint
       distances = [];
       for j= 1:1:size(pointsJoints{i}) %points of each joint
           for k = 1:1:n_obstacles
               if(strcmp(pointsCloud{k}{1,1}, Goal)==0 ||...
                       strcmp(pointsCloud{k}{1,1}, strcat(Goal, '_u'))==0 ||...
                            strcmp(pointsCloud{k}{1,1}, 'GlassFinal')==0)
                   for x = 1:1:size(pointsCloud{k}{1,2})
                       d = norm(pointsJoints{i}(j,:) - pointsCloud{k}{1,2}(x,:));
                       distances = [distances;d];
                   end
               end
           end
       end
       W(i,1) = min(distances);
    end
end