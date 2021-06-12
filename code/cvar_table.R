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


lag <- 190
vIND <- data.frame(cvar_ratio(pdata$rexIND,lag)) %>% rename(India = vr) %>% rename(e1 = error) # %>%  mutate(error = if_else(row_number() %% 2 != 0, 0, error)) %>% mutate(India = if_else(row_number() %% 2 == 0, error, India))
vLNK <- data.frame(cvar_ratio(pdata$rexLNK,lag)) %>% rename(SriLanka = vr) %>% rename(e2 = error)
vMAL <- data.frame(cvar_ratio(pdata$rexMAL,lag)) %>% rename(Malaysia = vr) %>% rename(e3 = error)
vMNR <- data.frame(cvar_ratio(pdata$rexMNR,lag)) %>% rename(Myanmar = vr) %>% rename(e4 = error)
vPAK <- data.frame(cvar_ratio(pdata$rexPAK,lag)) %>% rename(Pakistan = vr) %>% rename(e5 = error)
vPHL <- data.frame(cvar_ratio(pdata$rexPHL,lag)) %>% rename(Philippines = vr) %>% rename(e6 = error)
vTHI <- data.frame(cvar_ratio(pdata$rexTHI,lag)) %>% rename(Thailand = vr) %>% rename(e7 = error)

VR <- bind_cols(vIND, vLNK, vMAL, vMNR, vPAK, vPHL, vTHI)

VR

}