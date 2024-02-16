install.packages("tidyverse")
library(tidyverse)

library(conflicted)
library(dplyr)


bea <- read.csv("KS_BEA.csv")

glimpse(bea)

tail(bea)

bea <- bea %>% 
  slice(1:3604)
  
tail(bea)


bea_tidy <- bea %>% 
  pivot_longer(X2001:X2019, names_to = "Year", values_to = "Values")

head(bea_tidy)


bea_tidy <- bea %>% 
  pivot_longer(X2001:X2019, names_to = "Year", values_to = "Values", names_prefix = "X")

head(bea_tidy)


bea_tidder <- bea_tidy %>% 
  pivot_wider(names_from = Description, values_from = Values)

head(bea_tidder)  

bea_tidder <- bea_tidy %>% 
  pivot_wider(id_cols = c("GeoFIPS", "Year"),
              names_from = Description, values_from = Values)

head(bea_tidder)  
  
colSums(is.na(bea_tidder))

class(bea_tidder$'All industry total')


bea_the_best <- bea_tidder %>%
  mutate_at(vars(Year:'Private services-providing industries 3/'),  ~as.numeric(.))

bea_the_best <- bea_tidder %>%
  mutate(across(Year:'Private services-providing industries 3/'),  ~as.numeric(.))  

bea_more_better <- bea_the_best %>% 
  filter(GeoFIPS != "\"20000\"")

bea_more_better %>% 
  group_by(Year) %>% 
  summarise_all(., ~sum(., na.rm = 1))


bea_more_better %>% 
  group_by(Year) %>% 
  summarise_if(is.numeric, ~mean(., na.rm = 1))

bea_more_better <- bea_more_better %>%
  rename("Ag" =' Agriculture, forestry, fishing and hunting')

bea_more_better %>% 
  ggplot() +
  geom_histogram(aes(x=400))

bea_more_better %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_histogram(aes(x=400))

bea_more_better %>% 
  filter(Year == 2012) %>%
  ggplot() +
  geom_col(aes(x = Ag, y = GeoFIPS))

bea_more_better %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_col(aes(x = Ag, y = reorder(GeoFIPS, Ag)))
  
  
bea_more_better %>% 
  group_by(Year) %>% 
  summarise_if(is.nnumeric, ~mean(., na.rm = 1))


write.csv(bea_more_better, "bea_more_better.csv")

