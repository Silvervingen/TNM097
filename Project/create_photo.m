function [otp_image] = create_photo(pearl,pearlDia,input_image)

    [heigth2, width2] = size(input_image(:,:,1));
    pearlR = pearl;
    pearlG = pearl;
    pearlB = pearl;
    
    otp_image = zeros(heigth2 * pearlDia, width2 * pearlDia, 3);
    for i = 1:pearlDia:size(otp_image,1)
        for j = 1:pearlDia:size(otp_image,2)
            % Hämta rätt färg för pärlan utifrån matchedImage
            pearlR(pearlR~=1) = input_image(ceil(i/pearlDia),ceil(j/pearlDia),1);
            pearlG(pearlG~=1) = input_image(ceil(i/pearlDia),ceil(j/pearlDia),2);
            pearlB(pearlB~=1) = input_image(ceil(i/pearlDia),ceil(j/pearlDia),3);
    
            % Lägg till den färgade pärlan i bilden på rätt plats
            otp_image(i:i+pearlDia-1,j:j+pearlDia-1,1) = pearlR;
            otp_image(i:i+pearlDia-1,j:j+pearlDia-1,2) = pearlG;
            otp_image(i:i+pearlDia-1,j:j+pearlDia-1,3) = pearlB;
    
        end
    end
end