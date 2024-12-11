
tumorBW = imbinarize(tumorOriginal);
figure;
subplot(1,1,1);
imshowpair(tumorOriginal,tumorBW,"montage")
%nonlinear filter
filterSize = [15 15];
tumorMed = medfilt2(tumorOriginal,filterSize); 
figure;
subplot(1,2,1);
imshow(tumorMed)
title('USING MEDIAN filter');
%Binarize
tumorMedBW = imbinarize(tumorMed);
subplot(1,2,2);
imshow(tumorMedBW)
%wiener filter
filterSize = [15 15];
tumorW = wiener2(tumorOriginal,filterSize);
figure;
subplot(1,2,1);
imshow(tumorW)
title('USIING WIENER filter');
tumorWBW = imbinarize(tumorW);
subplot(1,2,2);
imshow(tumorWBW);