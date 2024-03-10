function colorPalette = generateColorPalette(numColors,saturation,value)
    % Generate a linearly spaced range of hues (0 to 1)
    hues = linspace(0, 1, numColors);

    % Initialize the color palette matrix
    colorPalette = zeros(numColors, 3);
    numColors = numColors-2 ;

    % Convert HSV to RGB for each hue
    for i = 1:numColors
        colorPalette(i, :) = hsv2rgb([hues(i), saturation, value]);
    end

    colorPalette(end,:) = [0 0 0]; % black
    colorPalette(end-1,:) = [1 1 1]; % white

    colorPalette = permute(colorPalette, [3, 1, 2]);
    
end