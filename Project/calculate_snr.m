function snr = calculate_snr(finalImage, Image)
    [height, width] = size(Image(:,:,1));
    [height2, width2] = size(finalImage(:,:,1));
    height_reshape = height2 - height;
    width_reshape = width2 - width;
    
    finalImage = finalImage(1:end-height_reshape, 1:end-width_reshape, :);
    
    snr = mysnr(Image, finalImage - Image);
end
