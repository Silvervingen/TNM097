function [ColorPalette2] = palette(colors)
    % funktion som kort skapar en slumpmässig färgpallet med "colors" antal
    % färger. Kommer behövas optimizeras

    paletteRGB = rand(1, colors, 3);
 
    ColorPalette2 = paletteRGB;
end