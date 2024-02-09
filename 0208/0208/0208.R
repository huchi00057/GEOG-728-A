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
#new %>%
#  arrange(-description) %>%
#  head()

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


p1 <- yield %>%
  # 刪除缺失值
  na.omit() %>%
  ggplot() +
  # aes 用來定義 X 與 Y， fill 用來做顏色
  geom_boxplot(aes(x=Yield_kg_ha, y = Crop,
                   fill = description)) +
  scale_fill_viridis_d(option = "A") #顏色方案
  # 使用簡約主題
  theme_minimal() +
  theme(legend.text = element_text(size = 6),
        legend_position = "bottom", # 圖例放底部
        legend.title = element_blank(), #圖例的標題去除
        asic.title.y = elemtne_blank())
  
str(p1)
  
p1$data
  
ggsave("bobbie.jpg", width = 5, height = 4, units = "in")
  

glimpse(yield)

  
yield_nona %>%
  ggplot() +
  geom_point(aes(x = Date, y = Yield_kg_ha)) +
  theme(axis.text.x = element_text(angle =  90)) # X軸上的數字的傾斜角度


ggplot(yield_nona) +
  geom_point(aes(x = as.Date(Date, format = "%m/%d/%Y"), y = Yield_kg_ha)) +
  theme(axis.text.x = element_text(angle =  90)) 

yield_nona %>%
  ggplot() +
  geom_smooth(aes(x = as.Date(Date, format = "%m/%d/%Y"),
                 y = Yield_kg_ha)) +
  theme(axis.text.x = element_text(angle =  90)) 


ggplot(yield_nona) +
  geom_smooth(aes(x = as.Date(Date, format = "%m/%d/%Y"),
                  y = Yield_kg_ha))



  ggplot(yield_nona) +
  geom_smooth(aes(x = as.Date(Date, format = "%m%d%Y"),
                 y = Yield_kg_ha,
                 color = Crop, fill = Crop), alpha = 0.2) +
  theme(axis.text.x = element_text(angle =  90)) +
  scale_color_brewer(palette = "YlGnBu") +
  scale_fill_brewer(palette = "YlGnBu")


### Here would be Tidyr

bea <- read.csv("KS_BEA.csv")

# str函數和glimpse都可以方便我們查看資料框內的變數細節
# str函數不僅僅展開tibble中的變量，而且將清單元素中的內容展開，不怎方便
# 因此，當含有列表的tibble資料時，使用glimpse函數能更簡潔明了。

# tibble是R语言中一个用来替换data.frame类型的扩展的DataFrame

str(bea)
glimpse(bea)
head(bea)
tail(bea)

bea_better <- bea %>%
  slice(1:(nrow(.)-4))

tail(bea_better)

bea_tidy <- bea_better %>%
  pivot_longer(., cols = X2001:X2019, names_to = "year",
              names_prefix = "X")

  glimpse(bea_tidy)
  
bea_tidier <- bea_tidy %>%
  pivot_wider(names_from = Description, values_from = value)














