ips <- function(dm){

  library(tidyverse)
  library(plm)
  library (tseries)
  library(tidystats)


  A <- purtest(dm, exo = "trend", test = "ips" , lags = 0, ips.stat ="tbar")
 # AA <- purtest(dm, exo = "trend", test = "ips" , lags = c(0, 0, 1, 0, 0, 0, 1))
  #g <- data.frame(A$statistic$ips.tbar.crit)

 # %>% rename("Critical Value" = A.statistic.ips.tbar.crit) %>% mutate("Significance Level" = c("1%", "5%", "10%")) %>% select("Significance Level", "Critical Value") %>%
  B <- data.frame(tidy_stats(A$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "Yes") %>% mutate(Outcome = "Reject H0") %>%  select(Test, "T-statistic", Trend)
  C <- purtest(dm, exo = "intercept", test = "ips" , lags = 0, ips.stat ="tbar")
  D <- data.frame(tidy_stats(C$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "IPS") %>% mutate(Trend = "No") %>% mutate(Outcome = "Reject H0") %>% select(Test, "T-statistic", Trend)




  table <- bind_rows(B,D)
  table
}
