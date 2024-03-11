function  diff = calculate_halftones(finalImage, Image)

    [heigth, width] = size(Image(:,:,1));
    [heigth2, width2] = size(finalImage(:,:,1));
    heigth_reshape = heigth2-heigth;
    width_reshape = width2 - width;
    
    finalImage = finalImage(1:end-heigth_reshape,1:end-width_reshape,:);
    
    halftone1 = finalImage(:,:,1);
    halftone2 = finalImage(:,:,2);
    halftone3 = finalImage(:,:,3);
    halftoneR = double(halftone1);
    halftoneG = double(halftone2);
    halftoneB = double(halftone3);

    finalImage_RGB = cat(3,halftoneR,halftoneG,halftoneB);
    
    original_lab = rgb2lab(Image);
    thresh_lab = rgb2lab(finalImage_RGB);
    
    diff = sqrt((original_lab(:,:,1) - thresh_lab(:,:,1)).^2 + (original_lab(:,:,2) - thresh_lab(:,:,2)).^2 + (original_lab(:,:,3) - thresh_lab(:,:,3)).^2);
    diff =  1/(heigth*width)*sum(diff,"all");
end