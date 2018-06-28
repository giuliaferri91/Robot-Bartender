shapes = {};
TBox = {[1 0 0 -0.75; 0 1 0 0; 0 0 1 0.5; 0 0 0 1], ...
        [1 0 0 1.75; 0 1 0 0; 0 0 1 0.5; 0 0 0 1], ...
        [1 0 0 0.5; 0 1 0 -1; 0 0 1 0.5; 0 0 0 1], ...
        [1 0 0 0.5; 0 1 0 1; 0 0 1 0.5; 0 0 0 1]};
[~,NBox] = size(TBox);
DimBox = {[0.7 1.2 0.05],[0.7 1.2 0.05], [0.55 0.4 0.05], [0.55 0.4 0.05]};
ColorBox = [0.85 0.85 0.85];
TypeBox = 'table';
shapes = createObjects(shapes,'Box',TBox,DimBox,ColorBox,NBox, TypeBox);
TBottle = {[1 0 0 1.9; 0 1 0 -0.65; 0 0 1 0.55; 0 0 0 1], ... 
        [1 0 0 1.6; 0 1 0 0; 0 0 1 0.55; 0 0 0 1], ...
        [1 0 0 1.9; 0 1 0 0.65; 0 0 1 0.55; 0 0 0 1], ...
        [1 0 0 -0.8; 0 1 0 -0.6; 0 0 1 0.55; 0 0 0 1], ...
        [1 0 0 -0.6; 0 1 0 0; 0 0 1 0.55; 0 0 0 1], ...
        [1 0 0 -0.8; 0 1 0 0.6; 0 0 1 0.55; 0 0 0 1]};
ColorBottle = {'blue','blue','blue','green','green', 'green'};
TypeBottle = {'Vodka','Gin','Rum','Cola','OrangeJuice', 'Lemon'};
[~,NBottle] = size(TBottle);
DimBottle = [0.15 0.15 0.35];
shapes = createObjects(shapes,'Bottle',TBottle,DimBottle,ColorBottle,NBottle,TypeBottle);
TGlassI = {[1 0 0 0.75; 0 1 0 1; 0 0 1 0.55; 0 0 0 1]};
ColorGlass = 'white';
TypeG = 'Glass';
DimGlass = [0.1 0.1 0.25];
shapes = createObjects(shapes,'Glass',TGlassI,DimGlass,ColorGlass,1, TypeG);
TypeG = 'GlassFinal';
TGlassF = {[1 0 0 0.5; 0 1 0 -1; 0 0 1 0.55; 0 0 0 1]};
shapes = createObjects(shapes,'Glass',TGlassF,DimGlass,ColorGlass,1, TypeG);
TSh = {[1 0 0 0.4; 0 1 0 1; 0 0 1 0.55; 0 0 0 1]};
ColorShaker = 'yellow';
TypeS = 'Shaker';
DimShaker = [0.12 0.12 0.25];
shapes = createObjects(shapes,'Shaker',TSh,DimShaker,ColorShaker,1,TypeS);

%plotObj = plotEnv(shapes);
pointsCloud = createPointsCloud(shapes);
%delete(plotVector{1,11})