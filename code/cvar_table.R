cvar_table <- function(pdata){
  
library(tidyverse)
  
cvar_ratio <- function(x, max.lag) {
  
  y <- matrix(ncol=2,nrow=max.lag)
  colnames(y) <- c("vr","error")
  N <- length(x)
  mu <- mean(diff(x))
  for (k in 1:max.lag) {
    variance <- var(diff(x, lag=k) - mu)
    dof.corr <- N/(N - k + 1)
    # This will become a ratio below
    y[k,"vr"] <- dof.corr * variance/k
    y[k,"error"] <- sqrt(2/(N - k))
    # y[k,"error"] <- sqrt((0.75*N/k)+1)
  }
  y[,"vr"] <- y[,"vr"]/y[1,"vr"]
  y[,"error"] <- sqrt(y[,"error"]^2 + y[1,"error"]^2)
  #
  return(y)
}

vIND <- data.frame(cvar_ratio(pdata$rexIND,190))
vLNK <- data.frame(cvar_ratio(pdata$rexLNK,190))
vMAL <- data.frame(cvar_ratio(pdata$rexMAL,190))
vMNR <- data.frame(cvar_ratio(pdata$rexMNR,190))
vPAK <- data.frame(cvar_ratio(pdata$rexPAK,190))
vPHL <- data.frame(cvar_ratio(pdata$rexPHL,190))
vTHI <- data.frame(cvar_ratio(pdata$rexTHI,190))

names <- data.frame("Countries (Currency)" = c("India Rupee", "Sri Lanka Rupee", "Malaysia Ringgit", "Myanmar Kyat", "Pakistan Rupee", "Phillipines Peso", "Thailand Baht"))


VR <- bind_rows(vIND$vr, vIND$error, vLNK$vr, vLNK$error, vMAL$vr, vMAL$error,
                vMNR$vr, vMNR$error, vPAK$vr, vPAK$error, vPHL$vr, vPHL$error, vTHI$vr, vTHI$error)

VR <- bind_cols(vIND, vIND, vLNK, vMAL, vMNR, vPAK, vPHL, vTHI)
FullVR <- bind_cols(names, VR)

FullVR

}