ips <- function(dm){

  library(tidyverse)
  library(plm)
  library (tseries)
  library(tidystats)
  install.packages("bootUR")
  library(bootUR)

  install.packages('PANICr')
  library(PANICr)
  panic10(x, nfac, k1, criteria, demean)
  
  panelout <- paneltest(pdata2, boot = "MBB", B = 399, verbose = TRUE) # Palm, Smeekes and Urbain (2011) introduced this test with the moving block bootstrap
  data.frame(tidy_stats(panelout))


  # purtest(object, test = c("levinlin", "ips", "madwu", "hadri"),
  #         exo = c("none", "intercept", "trend"),
  #         lags = c("SIC", "AIC", "Hall"), pmax = 10)

  lev <- purtest(pdata2, exo = "intercept", test = "levinlin" , lags = "AIC", pmax=10)
  summary(lev)
  lev <- data.frame(tidy_stats(lev$statistic))
  lev1 <- purtest(pdata2, exo = "trend", test = "levinlin" , lags = "AIC", pmax=10)
  summary(lev)
  lev1 <- data.frame(tidy_stats(lev$statistic))

  mad <- purtest(dm, exo = "intercept", test = "madwu" , lags = "AIC", pmax=10)
  summary(mad)
  mad1 <- purtest(dm, exo = "trend", test = "madwu" , lags = "AIC", pmax=10)
  summary(mad1)

  had <- purtest(pdata2, exo = "intercept", test = "hadri")
  summary(had)
  had1 <- purtest(pdata2, exo = "trend", test = "hadri")
  summary(had1)

  had <- purtest(pdata2, exo = "intercept", test = "hadri")
  summary(had)
  had1 <- purtest(pdata2, exo = "trend", test = "hadri")
  summary(had1)

  choi <- purtest(pdata2, exo = "intercept", test = "Pm", lags = "AIC", pmax=10)
  summary(choi)
  choi1 <- purtest(pdata2, exo = "trend", test = "Pm", lags = "AIC", pmax=10)
  summary(choi1)


  lev <- data.frame(tidy_stats(lev$statistic))
  had1 <- purtest(pdata2, exo = "trend", test = "levinlin" , lags = "AIC", pmax=10)
  summary(had1)
  lev1 <- data.frame(tidy_stats(lev$statistic))

  lev <- data.frame(tidy_stats(lev$statistic))

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
