ipsall <- function(dm, bret, postbret){
  
  library(tidyverse)
  library(plm)
  library (tseries)
  library(tidystats)
  
  ips <- purtest(dm, exo = "intercept", test = "ips", lags = c(0, 0, 1, 0, 0, 0, 1))
  ipsp <- data.frame((ips$statistic$p.value)) %>% rename("P value" = X.ips.statistic.p.value.)
  ips1 <- data.frame(tidy_stats(ips$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  ipss <- bind_cols(ips1, ipsp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  ips2 <- purtest(dm, exo = "trend", test = "ips", lags = c(0, 0, 1, 0, 0, 0, 1))
  ipsp1 <- data.frame((ips2$statistic$p.value)) %>% rename("P value" = X.ips2.statistic.p.value.)
  ips3 <- data.frame(tidy_stats(ips2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  ipsss <- bind_cols(ips3, ipsp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  ipsf <- bind_rows(ipss, ipsss)

  
  #postbret
  had <- purtest(postbret, exo = "trend", test = "ips", lags = c(0, 0, 1, 0, 0, 0, 1))
  hadp <- data.frame((had$statistic$p.value)) %>% rename("P value" = X.had.statistic.p.value.)
  had1 <- data.frame(tidy_stats(had$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  hadd <- bind_cols(had1, hadp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  had2 <- purtest(postbret, exo = "trend", test = "ips", lags = c(0, 0, 1, 0, 0, 0, 1))
  hadp1 <- data.frame((had2$statistic$p.value)) %>% rename("P value" = X.had2.statistic.p.value.)
  had3 <- data.frame(tidy_stats(had2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  haddd <- bind_cols(had3, hadp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  hadf <- bind_rows(hadd, haddd)
  
  #bret
  
  mad <- purtest(bret, exo = "trend", test = "ips", lags = c(0, 0, 0, 0, 0, 0, 1))
  madp <- data.frame((mad$statistic$p.value)) %>% rename("P value" = X.mad.statistic.p.value.)
  mad1 <- data.frame(tidy_stats(mad$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  madd <- bind_cols(mad1, madp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  mad2 <- purtest(bret, exo = "trend", test = "ips", lags = c(0, 0, 0, 0, 0, 0, 1))
  madp1 <- data.frame((mad2$statistic$p.value)) %>% rename("P value" = X.mad2.statistic.p.value.)
  mad3 <- data.frame(tidy_stats(mad2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "Luintel") %>%  select(Test, "T-statistic", Trend, Lags)
  maddd <- bind_cols(mad3, madp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)
  
  madf <- bind_rows(madd, maddd)
  
  table <- bind_rows(ipsf, madf, hadf)
  table
  
}