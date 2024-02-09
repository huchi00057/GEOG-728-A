yield <- read.csv("C:/Users/huchi/.git/test/GEOG-728-A/0206/agronomic_yields.csv")

library(tidyverse)
library(gapminder)
library(dplyr)

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
# Descending order
yield_nona %>%
  arrange(-Yield_kg_ha) %>% 
  head()

# Show last 10 data
yield_nona %>%
  arrange(-Yield_kg_ha) %>% 
  slice(1:10)

# average and sum for each description
new %>%
  arrange(-description) %>%
  head()

summ <- yield_nona %>%
  group_by(description) %>%
  summarize(aveY = mean(Yield_kg_ha),
            maxY = max(Yield_kg_ha))

summ 

# Plots

yield %>%
  na.omit() %>%
  ggplot() +
  geom_boxplot(aes(y = Yield_kg_ha))

# 區分開來的和狀圖
yield %>%
  na.omit() %>%
  ggplot() +
  geom_boxplot(aes(x = Yield_kg_ha, y = Crop))

                   
    
  




  
  
  