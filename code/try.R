# cvar_table <- function(pdata){
#   
#   library(tidyverse)
#   
#   cvar_ratio <- function(x, max.lag) {
#     
#     y <- matrix(ncol=2,nrow=max.lag)
#     colnames(y) <- c("vr","error")
#     N <- length(x)
#     mu <- mean(diff(x))
#     for (k in 1:max.lag) {
#       variance <- var(diff(x, lag=k) - mu)
#       dof.corr <- N/(N - k + 1)
#       # This will become a ratio below
#       y[k,"vr"] <- dof.corr * variance/k
#       y[k,"error"] <- sqrt(2/(N - k))
#       # y[k,"error"] <- sqrt((0.75*N/k)+1)
#     }
#     y[,"vr"] <- y[,"vr"]/y[1,"vr"]
#     y[,"error"] <- sqrt(y[,"error"]^2 + y[1,"error"]^2)
#     #
#     return(y)
#   }
#   
#   
#   
#   vIND <- data.frame(cvar_ratio(pdata$rexIND,190)) %>% rename(India = vr) # %>%  mutate(error = if_else(row_number() %% 2 != 0, 0, error)) %>% mutate(India = if_else(row_number() %% 2 == 0, error, India))
#   vLNK <- data.frame(cvar_ratio(pdata$rexLNK,190)) %>% rename("Sri Lanka" = vr)
#   vMAL <- data.frame(cvar_ratio(pdata$rexMAL,190)) %>% rename(Malaysia = vr)
#   vMNR <- data.frame(cvar_ratio(pdata$rexMNR,190)) %>% rename(Myanmar = vr)
#   vPAK <- data.frame(cvar_ratio(pdata$rexPAK,190)) %>% rename(Pakistan = vr)
#   vPHL <- data.frame(cvar_ratio(pdata$rexPHL,190)) %>% rename(Philippines = vr)
#   vTHI <- data.frame(cvar_ratio(pdata$rexTHI,190)) %>% rename(Thailand = vr)
#   
#   
#   
#   #and inserting a blank row (NAs row) for each one of my.df rows.
#   
#   na.df <- data.frame(vIND$India = 0, let = 0)
#   
#   my.df <- do.call(rbind, apply(my.df, 1, function(x) {rbind(x, na.df)}))
#   
#   
#   
#   
#   
#   
#   my.df <- do.call(rbind, apply(my.df, 1, function(x) {rbind(x, na.df)}))
#   b <- do.call(rbind, apply(b, 1, function(x) {rbind(x, c)}))
#   
#   mutate(India = if_else(row_number() %% 2 == 0, error, India))
#   
#   
#   #and inserting a blank row (NAs row) for each one of my.df rows.
#   
#   na.df <- data.frame(vIND.India = 0)
#   b <- data.frame(vIND$India)
#   bi <- do.call(rbind, apply(b, 1, function(x) {rbind(x, na.df)}))
#   c<- data.frame(vIND$error)
#   na.df1 <- data.frame(vIND.error = 0)
#   ci <- do.call(rbind, apply(c, 1, function(y) {rbind(y, na.df1)}))
#   d <- bind_rows(na.df1, ci) %>% slice_head(n=380)
#   
#   i <- bind_cols(bi, d)  %>%  mutate(vIND.India = if_else(row_number() %% 2 == 0, vIND.error, vIND.India)) %>% rename(India = vIND.India) %>% select(India) #%>% filter(row_number() %% 5 == 0 | row_number() %% 6 == 0)
#        
#   i <- i %>% rename(India = vIND.India) %>% select(India) %>% select(row_number() %% 5 == 0)
#   
# 
#   b <- do.call(rbind, apply(b, 1, function(x) {rbind(x, c)}))
#   
#   i <- bind_rows(b, c)
#   
#   names <- data.frame("Countries (Currency)" = c("India Rupee", "Sri Lanka Rupee", "Malaysia Ringgit", "Myanmar Kyat", "Pakistan Rupee", "Phillipines Peso", "Thailand Baht"))
#   
#   
#   VR <- bind_rows(vIND$India, vIND$error, vLNK$`Sri Lanka`, vLNK$error, vMAL$Malaysia, vMAL$error,
#                   vMNR$Myanmar, vMNR$error, vPAK$Pakistan, vPAK$error, vPHL$Philippines, vPHL$error, vTHI$Thailand, vTHI$error)
#   
#   VR <- bind_cols(vIND, vLNK, vMAL, vMNR, vPAK, vPHL, vTHI)
#   FullVR <- bind_cols(names, VR)
#   
#   FullVR
# }