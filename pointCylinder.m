function [points] = pointCylinder(centre, r, h, R)
    distPoints = 0.15;
    hPoints = floor(abs(h/distPoints));
    points = [];    
    for j = 0:1:hPoints%z
        for k = 0:pi/4:2*pi %x
            if(j==0 && k==0)
                p = centre;
            else
                p = points(1,:) + (R*[cos(k)*r;sin(k)*r;distPoints*j])';
            end
            points=[points;p];
            %plot3(p(1),p(2),p(3), 'c*')
        end
    end
    if(h~=0 && mod(h,distPoints)~=0)
        for k = 0:pi/4:2*pi %x
            p = points(1,:) + (R*[cos(k)*r;sin(k)*r;abs(h)])';
            %plot3(p(1),p(2),p(3), 'c*')
            points=[points;p];
        end
    end
end