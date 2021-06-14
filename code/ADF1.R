ADF1 <- function(pdata){
  
  #libraries
  library(tidyverse)
  library(tseries)
  
  #Augmented Dickey-Fuller test for panel data
  
  adfInd <- adf.test(pdata$rexIND, alternative = "stationary", k=0)
  adfInd #Indian Rupee
  
  adfLNK <- adf.test(pdata$rexLNK, alternative = "stationary", k=0)
  adfLNK #Sri Lanka Rupee
  
  adfMAL <- adf.test(pdata$rexMAL, alternative = "stationary", k=1)
  adfMAL # Malaysian Ringgit
  
  adfMNR <- adf.test(pdata$rexMNR, alternative = "stationary", k=0)
  adfMNR#Myanmar Kyat
  
  adfPAK <- adf.test(pdata$rexPAK, alternative = "stationary", k=2)
  adfPAK$statistic #Pakistani rupee
  
  adfPHL <- adf.test(pdata$rexPHL, alternative = "stationary", k=0)
  adfPHL #Phillipine peso
  
  adfTHI <- adf.test(pdata$rexTHI, alternative = "stationary", k=1)
  adfTHI #Thailand Baht
  
  names <- data.frame("Countries" = c("India (Rupee)", "Sri Lanka (Rupee)", "Malaysia (Ringgit)", "Myanmar (Kyat)", "Pakistan (Rupee)", "Phillipines (Peso)", "Thailand (Baht)"))
  
  
  ADFF <- bind_rows(adfInd$statistic, adfLNK$statistic, adfMAL$statistic,
                    adfMNR$statistic, adfPAK$statistic, adfPHL$statistic, adfTHI$statistic)
  FullADF <- bind_cols(names, ADFF)
  
  FullADF
  
}