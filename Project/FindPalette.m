function [foundColor] = findColorPalette(image,palette)
% This function finds the best matching color for each pixel in the image,
% by comparing the lowest dE between all pallets and the pixel
[width, height] = size(image(:,:,1));
im_Lab = rgb2lab(image);
pal_Lab = rgb2lab(palette);

for y = 1:1:height
    for x = 1:1:width
        
        for i = 1:1:length(palette)
        deltaE(1,i) = ComputeEuclidean_Distance(im_Lab(x,y,:), pal_Lab(1,i,:));
        end
        index = find(deltaE == min(deltaE));
        foundColor(x,y,1) = pal_Lab(1, index, 1);
        foundColor(x,y,2) = pal_Lab(1, index, 2);
        foundColor(x,y,3) = pal_Lab(1, index, 3);

    end
end

foundColor = lab2rgb(foundColor);
end