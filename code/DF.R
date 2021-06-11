

DF <- function(dm){

  #libraries
  library(tidyverse)
  library(tseries)

  #Augmented Dickey-Fuller test for panel data
  library(tseries)

  adfInd <- adf.test(dm$rexIND, alternative = "stationary", k=0,)
  adfInd #Indian Rupee

  adfLNK <- adf.test(dm$rexLNK, alternative = "stationary", k=0)
  adfLNK #Sri Lanka Rupee

  adfMAL <- adf.test(dm$rexMAL, alternative = "stationary", k=0)
  adfMAL # Malaysian Ringgit

  adfMNR <- adf.test(dm$rexMNR, alternative = "stationary", k=0)
  adfMNR#Myanmar Kyat

  adfPAK <- adf.test(dm$rexPAK, alternative = "stationary", k=0)
  adfPAK$statistic #Pakistani rupee

  adfPHL <- adf.test(dm$rexPHL, alternative = "stationary", k=0)
  adfPHL #Phillipine peso

  adfTHI <- adf.test(dm$rexTHI, alternative = "stationary", k=0)
  adfTHI #Thailand Baht

  names <- data.frame("Countries (Currency)" = c("India Rupee", "Sri Lanka Rupee", "Malaysia Ringgit", "Myanmar Kyat", "Pakistan Rupee", "Phillipines Peso", "Thailand Baht"))


  DF <- bind_rows(adfInd$statistic, adfLNK$statistic, adfMAL$statistic,
                  adfMNR$statistic, adfPAK$statistic, adfPHL$statistic, adfTHI$statistic)
  average <- mean(DF$`Dickey-Fuller`)
  average
  DF
  FullDF <- bind_cols(names, DF)

  FullDF

}