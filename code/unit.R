ips <- function(dm){
  
  library(tidyverse)
  library(plm)
  library (tseries)
  library(tidystats)
  
  # purtest(object, test = c("levinlin", "ips", "madwu", "hadri"),
  #         exo = c("none", "intercept", "trend"),
  #         lags = c("SIC", "AIC", "Hall"), pmax = 10)
  
  A <- purtest(dm, exo = "trend", test = "levinlin" , lags = "AIC", pmax=10)  
  summary(A)
  
  IPS <- purtest(dm, test = "ips", exo = "intercept", lags = "AIC", pmax = 5)
  ip <- purtest(dm, test = "ips", exo = "intercept", lags = "AIC", pmax = 10)
  
  summary(ip)
  
  #g <- data.frame(A$statistic$ips.tbar.crit) %>% rename("Critical Value" = A.statistic.ips.tbar.crit) %>% mutate("Significance Level" = c("1%", "5%", "10%")) %>% select("Significance Level", "Critical Value") %>% 
  B <- data.frame(tidy_stats(A$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>% mutate(Outcome = "Reject H0") %>%  select(Test, "T-statistic", Trend, Outcome) 
  C <- purtest(dm, exo = "intercept", test = "ips" , lags = 0, ips.stat ="tbar")  
  D <- data.frame(tidy_stats(C$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>% mutate(Outcome = "Reject H0") %>% select(Test, "T-statistic", Trend, Outcome)
  
  
  table <- bind_rows(B,D) 
  table
}
