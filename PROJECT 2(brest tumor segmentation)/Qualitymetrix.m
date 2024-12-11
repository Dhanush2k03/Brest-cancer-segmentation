%Quality matrix
bAvg = brisque(tumorAvg)
bMed = brisque(tumorMed)
bWien = brisque(tumorW)

montage({tumorOriginal tumorBW; tumorAvg tumorAvgBW; tumorMed tumorMedBW; tumorW tumorWBW})
title('Comparing different filt img with binary img')

