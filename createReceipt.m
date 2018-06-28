obstacles = shapes;
for i = 1:1:size(obstacles)
    centreBase = transl(obstacles{i}.transform);
    h = obstacles{i}.scale(1,3);
    r = obstacles{i}.scale(1,1);
    switch(obstacles{i}.note)           
        case 'Vodka'
            TVodka = rt2tr([0 0 1; 1 0 0; 0 1 0], centreBase+[-r-0.1;0;h/2+0.05]);
        case 'Gin'
            TGin = rt2tr([0 0 1; 1 0 0; 0 1 0], centreBase+[-r-0.1;0;h/2+0.05]);
        case 'Rum'
            TRum = rt2tr([0 0 1; 1 0 0; 0 1 0], centreBase+[-r-0.1;0;h/2+0.05]);
        case 'Cola'
            TCola = rt2tr([0 0 -1; -1 0 0; 0 1 0], centreBase+[r+0.15;0;h/2+0.05]);
        case 'OrangeJuice'
            TOrange = rt2tr([0 0 -1; -1 0 0; 0 1 0], centreBase+[r+0.15;0;h/2+0.05]);
        case 'Lemon'
            TLemon = rt2tr([0 0 -1; -1 0 0; 0 1 0], centreBase+[r+0.15;0;h/2+0.05]);
        case 'Shaker'
            TShaker = rt2tr([-1 0 0; 0 0 1; 0 1 0], centreBase+[0;-r-0.1;h/2+0.05]);
            TPourShakerUp = rt2tr([-1 0 0; 0 0 1; 0 1 0], centreBase+[0;0;h+0.5]) ;
            TMix = rt2tr([-1 0 0; 0 0 1; 0 1 0], [0.4485; 0.6881; 0.9848]);%[0.5;0.35;0.8]
            TPourShakerDown = rt2tr([1 0 0; 0 0 1; 0 -1 0], centreBase+[0;0;h+0.5]); 

        case 'Glass'
            TGlass = rt2tr([-1 0 0; 0 0 1; 0 1 0], centreBase+[0;-r-0.1;h/2+0.05]);
            TPourGlassUp = rt2tr([-1 0 0; 0 0 1; 0 1 0], centreBase+[0;0;h+0.5]) ;
            TPourGlassDown = rt2tr([1 0 0; 0 0 1; 0 -1 0], centreBase+[0;0;h+0.5]);
            
        case 'GlassFinal'
            TReadyCocktail = rt2tr([1 0 0; 0 0 -1; 0 1 0], centreBase+[0;+r+0.1;h/2+0.05]);
    end
end
GinLemon_Step = {'Gin'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Gin'; ...
                    'Lemon'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Lemon'; 'Shaker'; '' };
GinLemon = cat(3,  TGin, TPourShakerUp, TPourShakerDown, TPourShakerUp, TGin,...
               TLemon, TPourShakerUp ,TPourShakerDown, TPourShakerUp, TLemon, TShaker, TMix);

%SCREWDRIVER VODKA SUcco D'ARANCIA
VodkaOrange_Step = {'Vodka';'PourUp'; 'PourDown'; 'PourUp'; 'Vodka';...
                        'OrangeJuice'; 'PourUp'; 'PourDown'; 'PourUp' ; 'OrangeJuice'; 'Shaker'; ''};
VodkaOrange = cat(3,  TVodka, TPourShakerUp, TPourShakerDown, TPourShakerUp, TVodka,...
               TOrange, TPourShakerUp ,TPourShakerDown, TPourShakerUp, TOrange, TShaker, TMix);
           
RumCola_Step = {'Rum'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Rum';...
                'Cola'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Cola';'Shaker'; ''};           
RumCola = cat(3,  TRum, TPourShakerUp, TPourShakerDown, TPourShakerUp, TRum,...
               TCola, TPourShakerUp ,TPourShakerDown, TPourShakerUp, TCola, TShaker, TMix);
           
%BRASS MONKEY VODKA RUM SUCCO d'ARANCIA 
BrassMonkey_Step = {'Vodka'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Vodka';...
                        'Rum'; 'PourUp'; 'PourDown'; 'PourUp' ; 'Rum';...
                            'OrangeJuice'; 'PourUp'; 'PourDown'; 'PourUp' ;'OrangeJuice'; 'Shaker'; ''};
BrassMonkey = cat(3,  TVodka, TPourShakerUp, TPourShakerDown, TPourShakerUp, TVodka,...
                    TRum, TPourShakerUp, TPourShakerDown, TPourShakerUp, TRum,...
                      TOrange, TPourShakerUp ,TPourShakerDown, TPourShakerUp, TOrange, TShaker, TMix);
           
Final_Step = {'PourUp'; 'PourDown'; 'PourUp' ; 'Shaker'; 'Glass'; 'GlassFinal'; ''};           
Final = cat(3, TPourGlassUp, TPourGlassDown, TPourGlassUp, TShaker, TGlass, TReadyCocktail, Treset);
