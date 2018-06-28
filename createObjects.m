function [obj] = createObjects (objects, typeShape,T,dimension,color, number, type)
    switch(typeShape)
        case 'Box'
            for i = 1:1:number
                box = {Box(T{i}, dimension{i})};
                box{1}.FaceColor = color;
                %box{1}.FaceAlpha = 0.2;
                box{1}.note = type;
                objects = cat(1, objects, box);
            end
        case 'Bottle'
            for i = 1:1:number
                bottled = {Cylinder(T{i}, dimension)};
                bottled{1}.FaceColor = color{i};
                %bottled{1}.FaceAlpha = 0.2;
                bottled{1}.note = type{i};
                Tu = T{i};
                Tu(3,4) = Tu(3,4) + dimension(1,3);
                bottleu = {Cylinder(Tu,  dimension/2)};
                bottleu{1}.FaceColor = color{i};
                %bottleu{1}.FaceAlpha = 1;
                bottleu{1}.note = strcat(type{i},'_u'); 
                objects = cat(1, objects, bottled);
                objects = cat(1, objects, bottleu);
            end
       case 'Glass'
            for i = 1:1:number
                glass = {Cylinder(T{i}, dimension)};
                glass{1}.FaceColor = color;
                glass{1}.note = type; 
                objects = cat(1, objects, glass);  
            end
       case 'Shaker'
            for i = 1:1:number
                shaker = {Cylinder(T{i}, dimension)};
                shaker{1}.FaceColor = color;
                shaker{1}.note = type;
                objects = cat(1, objects, shaker);
            end
    end
    obj = objects;
end