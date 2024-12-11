%Removing Background in an Image
tumorBW = imbinarize(tumorOriginal);
filterSize = [15 15];
tumorMed = medfilt2(tumorOriginal,filterSize); 
tumorMedBW = imbinarize(tumorMed);
montage({tumorOriginal,tumorBW;tumorMed,tumorMedBW},"Size",[2 2])

%nhood = ones(30);
nhood = strel("disk",25);

tumorTopHat = imtophat(tumorMed,nhood);
%imshow(tumorTopHat)

tumorBW = imbinarize(tumorTopHat);
figure;
imshow(tumorBW);
title('Segmented tumor')