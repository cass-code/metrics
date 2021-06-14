ips_AIC <- function(dm){

  library(tidyverse)
  library(plm)
  library (tseries)
  library(tidystats)
  
ips <- purtest(dm, exo = "intercept", test = "ips", lags = "AIC", pmax = 8)
ipsp <- data.frame((ips$statistic$p.value)) %>% rename("P value" = X.ips.statistic.p.value.)
ips1 <- data.frame(tidy_stats(ips$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
ipss <- bind_cols(ips1, ipsp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

ips2 <- purtest(dm, exo = "trend", test = "madwu" , lags = "AIC", pmax=10)
ipsp1 <- data.frame((ips2$statistic$p.value)) %>% rename("P value" = X.ips2.statistic.p.value.)
ips3 <- data.frame(tidy_stats(ips2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
ipsss <- bind_cols(ips3, ipsp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

ipsf <- bind_rows(ipss, ipsss)
ipsf

}