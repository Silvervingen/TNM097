function [pearl] = createPearl(diameter)
% createPearl, Funktion för att skapa en bild av en ring/pärla.
% Denna funktion skapar en binär, logisk bild av en ring/pärla där alla värden = 1
% tillhör ringen och alla värden = 0 är bakgrund.

% Skapa bilden.
imageSizeX = diameter;
imageSizeY = diameter;
[columnsInImage, rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);

% Skapa pärlan i bilden.
centerXY = diameter/2;
outerRadius = diameter/2;
innerRadius = diameter/8;

array2D = (rowsInImage - centerXY).^2 + (columnsInImage - centerXY).^2;
ringPixels = array2D >= innerRadius.^2 & array2D <= outerRadius.^2;

% ringPixels är nu en logisk, binär matris som efterliknar en pärla.
% Invertera bilden för att göra svarta omården vita och vita svarta.
ringPixels = ~ringPixels;
% kontvertera till double
pearl = double(ringPixels);

end
