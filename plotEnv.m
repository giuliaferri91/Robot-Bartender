function [plotObj] = plotEnv(shapes) 
    plotObj={};
    hold on;
    for i = 1:1:size(shapes,1)
        plotObj = cat(1,plotObj, {plot(shapes{i}),shapes{i}.note});
        if (strcmp(shapes{i}.note, 'GlassFinal') == 1) 
            set(plotObj{i,1}, 'Visible', 'off');
        end
    end
    text(1.85,-0.1,0.8,'GIN','FontSize',8,'Color','white','FontWeight','bold')
    text(2.15,-0.95,0.8,'VODKA','FontSize',8,'Color','white','FontWeight','bold')
    text(2.15, 0.50,0.8,'RUM','FontSize',8,'Color','white','FontWeight','bold')
    text(-0.55, 0.45, 0.8,'LEMON','FontSize',8,'Color','white','FontWeight','bold')
    text(-0.3, -0.25,0.8,'ORANGE','FontSize',8,'Color','white','FontWeight','bold')
    text(-0.55, -0.8,0.8,'COLA','FontSize',8,'Color','white','FontWeight','bold')
    text(0.4,1,1,'SHAKER','FontSize',8,'Color','b','FontWeight','bold')
    text(0.75,1,1,'GLASS','FontSize',8,'Color','b','FontWeight','bold')

end