function [] = plotTraj(robot, plotObj, trajPlot)
    for i = 1:1:size(plotObj,1)
        set(plotObj{i,1}, 'Visible', 'on');
        if (strcmp(plotObj{i,2}, 'GlassFinal') == 1) 
            set(plotObj{i,1}, 'Visible', 'off');
        end
    end

    for i = 1:1:size(trajPlot,1)
        robot.plot(trajPlot{i,1});
        obj = trajPlot{i,2};
        if(strcmp(obj,'')==0 && strcmp(obj,'PourUp')==0 && strcmp(obj,'PourDown')==0)
            switch (obj)
                case 'Shaker'
                    for j = 1:1:size(plotObj,1)
                        if(strcmp(plotObj{j,2}, obj) == 1)
                            if(strcmp (get(plotObj{j,1},'Visible'),'off')==1) 
                                 set(plotObj{j,1},'Visible','on')
                            else
                                 set(plotObj{j,1},'Visible','off')
                            end
                        end
                    end
                case 'Glass'
                    for j = 1:1:size(plotObj,1)
                        if(strcmp(plotObj{j,2}, obj) == 1)   
                            set(plotObj{j,1},'Visible','off')
                        end
                    end
                case 'GlassFinal'
                    for j = 1:1:size(plotObj,1)
                        if(strcmp(plotObj{j,2}, obj) == 1)
                            set(plotObj{j,1},'Visible','on')
                        end
                    end
                otherwise 
                    for j = 1:1:size(plotObj,1)
                        if(strcmp(plotObj{j,2}, obj) == 1)
                            if(strcmp (get(plotObj{j,1},'Visible'),'off')==1) 
                                 set(plotObj{j,1},'Visible','on')
                            else
                                 set(plotObj{j,1},'Visible','off')
                            end
                        else 
                            if(strcmp(plotObj{j,2}, strcat(obj,'_u')) == 1)
                                if(strcmp (get(plotObj{j,1},'Visible'),'off')==1) 
                                    set(plotObj{j,1},'Visible','on')
                                else
                                    set(plotObj{j,1},'Visible','off')
                                end
                            end
                        end
                    end
            end
        end    
    end
end