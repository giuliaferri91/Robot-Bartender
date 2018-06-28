function [] = plotData(ctr, path, pathFit)  
    p1 = plot3(path(:,1),path(:,2),path(:,3),'ro');
    hold on;
    pathFit = pathFit';
    p2 = plot3(pathFit(:,1),pathFit(:,2),pathFit(:,3),'mo',...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor','black',...
        'MarkerSize',5);
    for i=1:1:size(ctr,3)
        ctrPoint = transl(ctr(:,:,i));
        p3 = plot3(ctrPoint(1),ctrPoint(2),ctrPoint(3),'g*');
    end
    hold off;
    title('Path End Effector')
    xlabel('x')
    ylabel('y')
    zlabel('z')
    legend([p1 p2 p3],'Path CollisionAvoidance','Path Fit', 'Path Ctraj')
end