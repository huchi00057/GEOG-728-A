##Back to BEA

library(tidyverse)
library(sf)
library(tigris)

bea <- read.csv("bea_more_better.csv")

counties <- counties(state = "KS")

class(counties)

head(counties)

head(bea)

bea <- bea %>%
  rename("Mining" = "X..Mining..quarrying..and.oil.and.gas.extraction",
         "All" = "All.industry.total") %>%
  select(GeoFIPS:Mining)

head(bea)

bea <- bea %>%
  mutate(GEOID = str_extract(GeoFIPS, "\\d+"))

head(bea)

bea[1,7]



bea_sf <- left_join(counties, bea, by = "GEOID")
head(bea_sf)  

counties <- counties %>%
  mutate(CNTY = GEOID)

bea_sf <- left_join(counties, bea, by = c("CNTY" = "GEOID"))


ggplot() +
  geom_sf(data = bea_sf, aes(fill = Ag)) 

# Class 02202024 Starts from Here

head(bea_sf)

#plot_sf

plot(bea_sf[bea_sf$Year == 2001, "Ag"])

bea_oneyr <- bea_sf[bea_sf$Year == 2001, "Ag"]

plot(bea_oneyr, nbreaks = 3)  # 將資料劃分為3個組別並繪製對應的圖表

plot(bea_oneyr, nbreaks = 5)  # 將資料劃分為5個組別並繪製對應的圖表

plot(bea_oneyr, nbreaks = 3, breaks = "jenks") # jenks 比例真實分布

plot(bea_oneyr, breaks = "jenks", nbreaks = 3,
     pal = c('#edf8b1',"#7fcdbb", '#2c7fb8'))

plot(bea_oneyr, breaks = "jenks", nbreaks = 3,
     pal = c('#edf8b1',"#7fcdbb", '#2c7fb8'),
     main = "bea_sf for 1 year in 2001 with Ag attribute",
     key.pos = 1, # key.pos 比例尺
     border = NA,
     bg = "gray",
     graticule = TRUE) # 外面框框的線


ggplot() +
  geom_sf(data = bea_oneyr, aes(fill = Ag))

bea_sf %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = Ag))

bea_sf %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = All))

bea_sf %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = log(All)))


bea_sf %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = log(All))) +
          guides(fill = guide_legend(title = "Total Economic Output (log($)"))

ggplot(bea_sf) +
  geom_histogram()


# Normalize that data by percent of total

bea_sf %>% 
  group_by(Year) %>% # 根據年份分組
  mutate(perc_total = All/sum(All)*100) %>% 
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = perc_total))


bea_sf %>% 
  group_by(Year) %>% 
  scale(bea_sf)
  filter(Year == 2012) %>% 
  ggplot() +
  geom_sf(aes(fill = perc_total))

  
scale()





