unit <- function(pdata2){

   library(tidyverse)
   library(plm)
   library (tseries)
   library(tidystats)



   # purtest(object, test = c("levinlin", "ips", "madwu", "hadri"),
   #         exo = c("none", "intercept", "trend"),
   #         lags = c("SIC", "AIC", "Hall"), pmax = 10)



   # Levinlin

   lev <- purtest(pdata2, exo = "intercept", test = "levinlin" , lags = "AIC", pmax=10)
   levp <- data.frame((lev$statistic$p.value)) %>% rename("P value" = X.lev.statistic.p.value.)
   lev1 <- data.frame(tidy_stats(lev$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "LL") %>% mutate(Trend = "No") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
   levv <- bind_cols(lev1, levp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   lev2 <- purtest(pdata2, exo = "trend", test = "levinlin" , lags = "AIC", pmax=10)
   levp1 <- data.frame((lev2$statistic$p.value)) %>% rename("P value" = X.lev2.statistic.p.value.)
   lev3 <- data.frame(tidy_stats(lev2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "LL") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
   levvv <- bind_cols(lev3, levp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   levf <- bind_rows(levv, levvv)


   #Madwu

   mad <- purtest(pdata2, exo = "intercept", test = "madwu" , lags = "AIC", pmax=10)
   madp <- data.frame((mad$statistic$p.value)) %>% rename("P value" = X.mad.statistic.p.value.)
   mad1 <- data.frame(tidy_stats(mad$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "MadWu") %>% mutate(Trend = "No") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
   madd <- bind_cols(mad1, madp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   mad2 <- purtest(pdata2, exo = "trend", test = "madwu" , lags = "AIC", pmax=10)
   madp1 <- data.frame((mad2$statistic$p.value)) %>% rename("P value" = X.mad2.statistic.p.value.)
   mad3 <- data.frame(tidy_stats(mad2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "MadWu") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "AIC") %>%  select(Test, "T-statistic", Trend, Lags)
   maddd <- bind_cols(mad3, madp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   madf <- bind_rows(madd, maddd)

 # Hadri

   had <- purtest(pdata2, exo = "intercept", test = "hadri")
   hadp <- data.frame((had$statistic$p.value)) %>% rename("P value" = X.had.statistic.p.value.)
   had1 <- data.frame(tidy_stats(had$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "Hadri") %>% mutate(Trend = "No") %>%  mutate(Lags = "NA") %>%  select(Test, "T-statistic", Trend, Lags)
   hadd <- bind_cols(had1, hadp) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   had2 <- purtest(pdata2, exo = "trend", test = "hadri" , lags = "AIC", pmax=10)
   hadp1 <- data.frame((had2$statistic$p.value)) %>% rename("P value" = X.had2.statistic.p.value.)
   had3 <- data.frame(tidy_stats(had2$statistic)) %>% rename("T-statistic" = statistics.statistic.value) %>% mutate(Test = "Hadri") %>% mutate(Trend = "Yes") %>%  mutate(Lags = "NA") %>%  select(Test, "T-statistic", Trend, Lags)
   haddd <- bind_cols(had3, hadp1) %>%  select(Test, "T-statistic", "P value", Trend, Lags)

   hadf <- bind_rows(hadd, haddd)


  # Final
   table <- bind_rows(levf, madf, hadf)
   table
 }
