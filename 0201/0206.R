yield <- read.csv("agronomic_yields.csv")

library(tidyverse)
library(gapminder)

ggplot(data = yield)+
  geom_histogram(aes(x = Yield_kg_ha, fill = Crop),
                 color = "black", alpha = 0.6) +
  theme_minimal() +
  scale_fill_brewer(palette = "RdYlBu")

yield_nona <- yield %>%
  filter(!(is.na(Yield_kg_ha)))

yield %>%
  filter(!(is.na(Yield_kg_ha))) %>%
  filter(!(is.na(Yield_bu_A))) %>%
  select(-Yield_kg_ha) %>%
  head()


yield %>%
  filter(!(is.na(Yield_kg_ha))) %>%
  filter(!(is.na(Yield_bu_A))) %>%
  select(Crop:Treatment) %>%
  head()  

# reduce 10 data from 1272 to 1262
yield_nona <- yield %>%
  na.omit()
  
# Sorting
# dDescending order
yield_nona %>%
  arrange(-Yield_kg_ha) %>% 
  head()

yield_nona %>%
  arrange(-Yield_kg_ha) %>% 
  slice(1:10)


summ <- yield_nona %>%
  




  
  
  