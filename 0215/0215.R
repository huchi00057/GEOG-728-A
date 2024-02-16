# 載入套件

install.packages("spData")

library(spData)


# 先匯入資料
data(elect80)

class(elect80)

str(elect80)

head(elect80)

head(elect80@data)
# head(elect80$data)


# 畫圖
sp::plot(elect80) #黑色十字

sp::plot(elect80, pch = 20, cex = 0.5, col = "lightblue") #藍色小圓點

data("us_states")

head(us_states)

plot(us_states[, 1])  #畫圖


### Back to BEA

install.packages("tidyverse")
install.packages("sf")
install.packages("tigris")

library(tidyverse)
library(sf)
library(tigris)

bea <- read.csv("KS_BEA.csv")

counties <- counties(state = "KS")

class(counties)

head(counties)

str(counties)

#glimpse(counties)


head(bea)

bea <- bea %>% 
  rename("Mining" = "X..Mining..quarrying..and.oil.and.gas.extraction",
         "All" = "x.All.industry.total") %>% 
  select(GeoFIPS:Mining)

head(bea)


bea <- bea %>% 
  mutate(GEOID = str_extra)

head(bea)

bea[1,7]


bea_sf <- left_join(counties, by = "GEOID")
head(bea_sf)



counties <- counties %>% 
  mutate(CNTY = GEOID)

bea_sf <- left_join(counties, bea, by = c("CNTY" = "GEOID"))


ggplot() + 
  geom_sf(data = bea_sf, aes(fill - Ag))


    
