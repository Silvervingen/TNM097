function [ColorPalette] = Palette3()


    % Skapa en mapp för att lagra alla färger
    ColorPalette = zeros(1, 125, 3);

    % Loopa genom varje primärfärg och generera nyanser
    idx = 1;
    for i = 1:5
        for j = 1:5
            for k = 1:5
                ColorPalette(1, idx, 1) = (i-1) / 4;  % R-kanalen
                ColorPalette(1, idx, 2) = (j-1) / 4;  % G-kanalen
                ColorPalette(1, idx, 3) = (k-1) / 4;  % B-kanalen
                idx = idx + 1;
            end
        end
    end

    % Visa dimensionerna för den resulterande variabeln
    disp(['Dimensioner för ColorPalette: ', num2str(size(ColorPalette))]);

end