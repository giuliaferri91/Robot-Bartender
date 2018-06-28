function [newPath] = fitData(data)            
    sd=size(data);
    t=linspace(0,1,sd(1))';
    t2=linspace(0,1,500)';
    polyOrder=[10 10 10];
        xcoefs=polyfit(t,data(:,1),polyOrder(1));
            x=polyval(xcoefs,t2);
        ycoefs=polyfit(t,data(:,2),polyOrder(2));
            y=polyval(ycoefs,t2);
        zcoefs=polyfit(t,data(:,3),polyOrder(3));
            z=polyval(zcoefs,t2);
    newPath = [x';y';z'];
    % delete points too close 
    i = 2;
    while i < size(newPath,2)
        if norm(newPath(:,i-1)-newPath(:,i)) < 0.025
            newPath = horzcat(newPath(:,1:i-1), newPath(:,i+1:end));
        else
            i=i+1;
        end
    end
end