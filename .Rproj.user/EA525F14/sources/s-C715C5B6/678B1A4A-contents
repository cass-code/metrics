
# libraries
library(tidyverse)
list.files('code/', full.names = T, recursive = T) %>% as.list() %>% walk(~source(.))



# reading in data
ind <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/ind.dat")
lnk <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/lnk.dat")
mal <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/mal.dat")
mnr <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/mnr.dat")
pak <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/pak.dat")
phl <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/phl.dat")
thi <- read_table("C:/Users/Cassandra/OneDrive/Documents/2021 Academics/Metrics/Time Series Project/R stuffs/Write_Up/data/files/thi.dat")

# adding in a column to each data set for the real exchange rate

rexIND <- ind %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexIND = real_exchange(INDEX, INDCPI, USCPI)) %>% select(ENTRY, rexIND)
rexLNK <- lnk %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexLNK = real_exchange(LNKEX, LNKCPI, USCPI)) %>% select(rexLNK)
rexMAL <- mal %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexMAL = real_exchange(MALEX, MALCPI, USCPI)) %>% select(rexMAL)
rexMNR <- mnr %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexMNR = real_exchange(MNREX, MNRCPI, USCPI)) %>% select(rexMNR)
rexPAK <- pak %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexPAK = real_exchange(PAKEX, PAKCPI, USCPI)) %>% select(rexPAK)
rexPHL <- phl %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexPHL = real_exchange(PHLEX, PHLCPI, USCPI)) %>% select(rexPHL)
rexTHI <- thi %>% mutate(ENTRY = as.factor(ENTRY)) %>% mutate(rexTHI = real_exchange(THIEX, THICPI, USCPI)) %>% select(rexTHI)

# binding the columns together for a panel data setof real exchange rates

pdata <- bind_cols(rexIND,rexLNK, rexMAL, rexMNR,  rexPAK,  rexPHL,  rexTHI)
view(pdata)
