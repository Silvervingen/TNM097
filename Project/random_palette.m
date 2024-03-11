function [ColorPalette,opt_paletteRGB,opt2_paletteRGB] = random_palette(colors, min_deltaE,image)
    % funktion som kort skapar en slumpmässig färgpallet med "colors" antal
    % färger. Kommer behövas optimizeras

    % hur många av de mest dominanta färgerna som vi ska använda i
    % opt2_colorPallette, högre nummer ger en större palett.
    opt2_colors = 35;

    % Optimisera genom att skaapa en threshold så att dE behöver vara över
    % detta för att den ska läggas in i en annan färgpallett?
    paletteRGB = rand(1, colors, 3);
    ColorPalette = paletteRGB;
    paletteLAB = rgb2lab(paletteRGB);
    L = paletteLAB(:,:,1);
    A = paletteLAB(:,:,2);
    B = paletteLAB(:,:,3);

    for i = 1:1:colors
        for j = i+1:1:colors
            
            % Beräkna deltaE mellan valda pixeln och alla efterkommande pixlar
            deltaE = sqrt((L(:,i) - L(:,j)).^2 + (A(:,i) - A(:,j)).^2 + (B(:,i) - B(:,j)).^2);
            
            if deltaE < min_deltaE
                % Sätt färgen som liknar till -1 värde för LAB
                L(1,i) = -1;
                A(1,i) = -1;
                B(1,i) = -1;
                
                break;
            end
        end
    end
    % Om L, A eller B är -1, ta bort
    L(L == -1) = [];
    A(A == -1) = [];
    B(B == -1) = [];
    
    % Sätt ihop alla
    LAB = cat(3, L, A, B);
    
    % Konvertera tillbaka paletten från Lab rymden till RGB
    paletteRGB = lab2rgb(LAB);

    % optimering här
    opt_paletteRGB = paletteRGB;

        % Optimering 2
    [~, colorMap] = rgb2ind(image, opt2_colors, 'nodither');

    colorMapPalette = zeros(1,opt2_colors,3);

    for i = 1:opt2_colors
        colorMapPalette(1,i,1) = colorMap(i,1);
        colorMapPalette(1,i,2) = colorMap(i,2);
        colorMapPalette(1,i,3) = colorMap(i,3);
    end

    colors_lab = rgb2lab(colorMapPalette);
    palette_Lab = rgb2lab(ColorPalette);
    for i = 1:opt2_colors
        for j = 1:length(palette_Lab)
            deltaE(1,j) = ComputeEuclidean_Distance(colors_lab(1,i,:), palette_Lab(1,j,:));
        end
            index = find(deltaE == min(deltaE));
            foundColor(1,i,1) = palette_Lab(1, index, 1);
            foundColor(1,i,2) = palette_Lab(1, index, 2);
            foundColor(1,i,3) = palette_Lab(1, index, 3);
            palette_Lab(1, index, 3) = -100;
            palette_Lab(1, index, 3) = -100;
            palette_Lab(1, index, 3) = -100;
    end
    foundColors = lab2rgb(foundColor);
    opt2_paletteRGB = foundColors;
end