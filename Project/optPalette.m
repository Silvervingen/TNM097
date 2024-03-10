function [opt_paletteRGB] = optPalette(paletteRGB, min_deltaE)
    % Convert RGB to Lab color space
    paletteLAB = rgb2lab(paletteRGB);
    
    % Number of colors in the palette
    colors = 100;
    
    % Extract L, A, B components
    L = paletteLAB(:,:,1);
    A = paletteLAB(:,:,2);
    B = paletteLAB(:,:,3);

    % Loop through each color
    for i = 1:colors
        for j = i+1:colors
            % Calculate deltaE between the selected pixel and all subsequent pixels
            deltaE = sqrt((L(:,i) - L(:,j)).^2 + (A(:,i) - A(:,j)).^2 + (B(:,i) - B(:,j)).^2);
            
            % Check if deltaE is less than the specified threshold
            if deltaE < min_deltaE
                % Set color that is similar to -1 value for LAB
                L(1,i) = -1;
                A(1,i) = -1;
                B(1,i) = -1;
                
                % Break the loop as the color is removed
                break;
            end
        end
    end
    
    % Remove colors marked as -1
    L(L == -1) = [];
    A(A == -1) = [];
    B(B == -1) = [];
    
    % Concatenate L, A, B to form LAB color space
    LAB = cat(3, L, A, B);
    
    % Convert back to RGB color space
    opt_paletteRGB = lab2rgb(LAB);
end
