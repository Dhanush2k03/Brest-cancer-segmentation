%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% SEGMENTATION OF BREAST TUMOR USING DIFFERENT FILTERING TECHNIQUES  %     
%                            PROJECT2                               %        
%                                                                   %
%-------------------------------------------------------------------%
%        using linear and nonlinear filter for segmentation         %                                                   
%        we use quality metrix to determine which filter to use     %                               
%        Backgroundremoval is done for segmentation                 %                                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%% BLOCK PROCESSING

tumorOriginal = imread("tumorSmallFile.jpg");
figure;
subplot(1,2,1);
imshow(tumorOriginal);
title('tumororginal img');
tumor = blockproc(tumorOriginal,[5 5],@shrinkImage);
subplot(1,2,2);
imshow(tumor);
title('Block processed img');
function newBlock = shrinkImage(blockStruct)
    % shrinkImage extracts the block data from the input structure
    % and finds its median and returns that scalar as the output
    
    % extract the data field of the structure blockStruct
    block = blockStruct.data;
    
    % calculate the median of the data field and save to newBlock
    newBlock = median(block,"all");
    
end

%% Remove Noise with a Linear Filter

tumorBW = imbinarize(tumorOriginal);
figure;
subplot(1,1,1);
imshowpair(tumorOriginal,tumorBW,"montage")
title('tumorOrginal vs binaryimg')
filterSize = [15 15];
avg = fspecial("average",filterSize);
tumorAvg = imfilter(tumorOriginal,avg);
figure;
subplot(1,3,1);
imshow(tumorAvg);
title('Average filtered')
tumorAvg = imfilter(tumorOriginal,avg,"symmetric");% The options for boundary techniques are "symmetric", "replicate", "circular"
subplot(1,3,2);
imshow(tumorAvg);
title('Taking the boder away');
tumorAvgBW = imbinarize(tumorAvg);
subplot(1,3,3);
imshow(tumorAvgBW)
title('Binary image');

%filterSize = [15 15];
%avg = fspecial("average",filterSize);
%tumorAvg = imfilter(tumorOriginal,avg,"symmetric");
%tumorAvgBW = imbinarize(tumorAvg);
figure;
subplot(1,1,1);
imshowpair(tumorBW,tumorAvgBW,"montage");
title('final result');


