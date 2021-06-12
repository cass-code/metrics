vtab <- function (VR){
  
  library(tidyverse)
  # India
  na1 <- data.frame(India = 0)
  b <- data.frame(VR$India)
  bi <- do.call(rbind, apply(b, 1, function(x) {rbind(x, na1)}))
  c<- data.frame(VR$e1)
  na2 <- data.frame(e1 = 0)
  ci <- do.call(rbind, apply(c, 1, function(y) {rbind(y, na2)}))
  d <- bind_rows(na2, ci) %>% slice_head(n=380)
  
  indiavr <- bind_cols(bi, d)  %>%  mutate(India = if_else(row_number() %% 2 == 0, e1, India)) %>% select(India)
  
  # Sri Lanka
  na3 <- data.frame(SriLanka = 0)
  e <- data.frame(VR$SriLanka)
  ei <- do.call(rbind, apply(e, 1, function(x) {rbind(x, na3)}))
  f <- data.frame(VR$e2)
  na4 <- data.frame(e2 = 0)
  fi <- do.call(rbind, apply(f, 1, function(y) {rbind(y, na4)}))
  g <- bind_rows(na4, fi) %>% slice_head(n=380)
  
  lankvr <- bind_cols(ei, g)  %>%  mutate(SriLanka = if_else(row_number() %% 2 == 0, e2, SriLanka)) %>% select(SriLanka)
  
  # Malaysia
  MALna1 <- data.frame(Malaysia = 0)
  MALe <- data.frame(VR$Malaysia)
  MALei <- do.call(rbind, apply(MALe, 1, function(x) {rbind(x, MALna1)}))
  MALf <- data.frame(VR$e3)
  MALna2 <- data.frame(e3 = 0)
  MALfi <- do.call(rbind, apply(MALf, 1, function(y) {rbind(y, MALna2)}))
  MALg <- bind_rows(MALna2, MALfi) %>% slice_head(n=380)
  
  malvr <- bind_cols(MALei, MALg)  %>%  mutate(Malaysia = if_else(row_number() %% 2 == 0, e3, Malaysia)) %>% select(Malaysia)
  
  
  # Myanmar
  MNRna1 <- data.frame(Myanmar = 0)
  MNRe <- data.frame(VR$Myanmar)
  MNRei <- do.call(rbind, apply(MNRe, 1, function(x) {rbind(x, MNRna1)}))
  MNRf <- data.frame(VR$e4)
  MNRna2 <- data.frame(e4 = 0)
  MNRfi <- do.call(rbind, apply(MNRf, 1, function(y) {rbind(y, MNRna2)}))
  MNRg <- bind_rows(MNRna2, MNRfi) %>% slice_head(n=380)
  
  mnrvr <- bind_cols(MNRei, MNRg)  %>%  mutate(Myanmar = if_else(row_number() %% 2 == 0, e4, Myanmar)) %>% select(Myanmar)
  
  #Pakistan
  PAKna1 <- data.frame(Pakistan = 0)
  PAKe <- data.frame(VR$Pakistan)
  PAKei <- do.call(rbind, apply(PAKe, 1, function(x) {rbind(x, PAKna1)}))
  PAKf <- data.frame(VR$e5)
  PAKna2 <- data.frame(e5 = 0)
  PAKfi <- do.call(rbind, apply(PAKf, 1, function(y) {rbind(y, PAKna2)}))
  PAKg <- bind_rows(PAKna2, PAKfi) %>% slice_head(n=380)
  
  pakvr <- bind_cols(PAKei, PAKg)  %>%  mutate(Pakistan = if_else(row_number() %% 2 == 0, e5, Pakistan)) %>% select(Pakistan)
  
  
  #Philippines
  PHLna1 <- data.frame(Philippines = 0)
  PHLe <- data.frame(VR$Philippines)
  PHLei <- do.call(rbind, apply(PHLe, 1, function(x) {rbind(x, PHLna1)}))
  PHLf <- data.frame(VR$e6)
  PHLna2 <- data.frame(e6 = 0)
  PHLfi <- do.call(rbind, apply(PHLf, 1, function(y) {rbind(y, PHLna2)}))
  PHLg <- bind_rows(PHLna2, PHLfi) %>% slice_head(n=380)
  
  phlvr <- bind_cols(PHLei, PHLg)  %>%  mutate(Philippines = if_else(row_number() %% 2 == 0, e6, Philippines)) %>% select(Philippines)
  
  #Thailand
  THIna1 <- data.frame(Thailand = 0)
  THIe <- data.frame(VR$Thailand)
  THIei <- do.call(rbind, apply(THIe, 1, function(x) {rbind(x, THIna1)}))
  THIf <- data.frame(VR$e7)
  THIna2 <- data.frame(e7 = 0)
  THIfi <- do.call(rbind, apply(THIf, 1, function(y) {rbind(y, THIna2)}))
  THIg <- bind_rows(THIna2, THIfi) %>% slice_head(n=380)
  
  thivr <- bind_cols(THIei, THIg)  %>%  mutate(Thailand = if_else(row_number() %% 2 == 0, e7, Thailand)) %>% select(Thailand)
  
  # Labels

  lna1 <- data.frame(Months = 0)
  lb <- data.frame(Months = 1:190, se = 1:190) 
  llb <- data.frame(lb$Months)
  lbi <- do.call(rbind, apply(llb, 1, function(x) {rbind(x, lna1)}))
 
  lc<- data.frame(lb$se)
  lna2 <- data.frame(lb.se = 1000)
  lci <- data.frame(do.call(rbind, apply(lc, 1, function(y) {rbind(y, lna2)}))) %>% rename(se = lb.se) 
  #ld <- bind_rows(lna2, lci) %>% slice_head(n=380) %>% rename(se = lb.se) 
  
  labels1 <- bind_cols(lbi, lci)  %>%  mutate(Months = if_else(row_number() %% 2 == 0, se, Months)) %>% select(Months) %>% mutate(Months = replace(Months, Months==1000, "se"))
  
  Fullvr <- bind_cols(labels1,indiavr, lankvr, malvr, mnrvr, pakvr, phlvr, thivr)
  
  Fullvr
}
