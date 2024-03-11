function [result] = calculate_scielab(finalImage, Image)

    ppi = 112; d = 10; % för 27 tum 1440p skärm, 0.25m bort
    sampPerDegree = ppi*d*tan(pi/180);
    
    [heigth, width] = size(Image(:,:,1));
    [heigth2, width2] = size(finalImage(:,:,1));
    heigth_reshape = heigth2-heigth;
    width_reshape = width2 - width;

    image_xyz = rgb2xyz(Image);
    M = finalImage(1:end-heigth_reshape,1:end-width_reshape,:);
    finalImage_xyz = rgb2xyz(M);
    
    result = mean(scielab(sampPerDegree,finalImage_xyz,image_xyz,[95.05, 100, 108.9],'xyz'),"all");

end