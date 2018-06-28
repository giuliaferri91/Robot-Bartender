function [pointsCloud] = createPointsCloud(shapes)
%     hold on
    distPoints = 0.15;
    for i = 1:1:size(shapes)
        switch(class(shapes{i}))
        case 'Box'
            dim = shapes {i}.scale*2; %dimension of table
            % number of points for each axes on the shape
            nPAxes = floor((shapes {i}.scale*2)/distPoints)';
            centre = transl(shapes {i}.transform)';
            points = [];
            for j = 0:1:(nPAxes(3)+1) %z
                for k = 0:1:(nPAxes(2)+1) %y
                    for l = 0:1:(nPAxes(1)+1) %x
                        if(l==0 && j ==0 && k==0)
                            p = centre - dim/2;
                        else
                            p =  points(1,:) + [distPoints*l distPoints*k distPoints*j];
                            if(p(1)> (points(1,1)+dim(1)))
                                p(1)= points(1,1)+dim(1);
                            end
                            if(p(2)> (points(1,2)+dim(2)))
                                p(2)= points(1,2)+dim(2);
                            end
                            if(p(3)> (points(1,3)+dim(3)))
                                p(3)= points(1,3)+dim(3);
                            end   
                        end
                        points = cat(1,points,p);
                    end
                end
            end
            pointsCloud{i,:} = {'table', points};
        case 'Cylinder'
            centre = transl(shapes {i}.transform)';
            r = shapes {i}.scale(1,1);
            h = shapes {i}.scale(1,3);
            points = [];    
            for j = 0:1:floor(h/distPoints)+1 %z
                for k = 0:pi/4:2*pi %x
                    if(j ==0 && k==0)
                        p = centre;
                    else
                        p = points(1,:) + [cos(k)*r sin(k)*r distPoints*j];
                        if(p(3) > (points(1,3)+h))
                            p(3)= points(1,3)+h;
                        end   
                    end
                    points = cat(1,points,p);
                end
            end
            pointsCloud{i,:} = {shapes{i}.note, points};
        end
    end
%     for i = 1:1:size(pointsCloud)
%       for j = 1:1:size(pointsCloud{i}{1,2})
%           plot3(pointsCloud{i}{1,2}(j,1),pointsCloud{i}{1,2}(j,2),pointsCloud{i}{1,2}(j,3), 'r*');
%       end
%     end
end