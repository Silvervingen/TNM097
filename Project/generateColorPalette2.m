function colorPalette = generateColorPalette(numColors,saturation,value)
    % Generate a linearly spaced range of hues (0 to 1)
    hues = linspace(0, 1, numColors);

    % Initialize the color palette matrix
    colorPalette = zeros(numColors, 3);

    % Calculate the scaling factor for saturation and value
    numColorsScaled = numColors - 1;
    saturationScaled = saturation / (numColorsScaled / 2);
    valueScaled = value / (numColorsScaled / 2);

    % Convert HSV to RGB for each hue
    for i = 1:numColors
        % Scale the saturation and value based on the number of colors
        colorPalette(i, :) = hsv2rgb([hues(i), min(saturationScaled * (i-1), 1), min(valueScaled * (i-1), 1)]);
    end

    % Add white to the palette
    colorPalette(end,:) = [1 1 1]; % white

    % Transpose the colorPalette matrix
    colorPalette = permute(colorPalette, [3, 1, 2]);
end