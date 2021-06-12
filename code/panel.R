panel <- function(pdata2, dm){


   library(tidyverse)
   #install.packages("bootUR")
   library(bootUR)

   #Bootstrap panel test

   #The function panel_test performs a test on a multivariate (panel) time series by testing the null hypothesis that all series have a unit root. A rejection is typically interpreted as evidence that a 'significant proportion' of the series is stationary, although how large that proportion is - or which series are stationary - is not given by the test. The test is based on averaging the individual test statistics, also called the Group-Mean (GM) test in Palm, Smeekes and Urbain (2011).

   panelout <- paneltest(pdata2, boot = "MBB", B = 399, verbose = FALSE) # Palm, Smeekes and Urbain (2011) introduced this test with the moving block bootstrap
   rm <- data.frame(panelout)
   panelout1 <- paneltest(dm, boot = "MBB", B = 399, verbose = FALSE)
   dm1 <- data.frame(panelout1)

  palm <- data.frame(bind_rows(rm, dm1)) %>% rename("Test Statistic" = "test.statistic", "p Value" = p.value) %>% mutate(Test = c("Panel", "Panel Demeaned")) %>% select(Test, "Test Statistic", "p Value")
  # typeof(panelout)
  palm

# library(xtable)
#    table <- xtable(palm, caption = "Bootstrapped panel unit root tests")
#    print.xtable(table,
#                 # tabular.environment = "longtable",
#                 floating = TRUE,
#                 table.placement = 'H',
#                 include.rownames = FALSE,
#                 # scalebox = 0.3,
#                 comment = FALSE,
#                 caption.placement = 'top'
#    )
#
#    table


}