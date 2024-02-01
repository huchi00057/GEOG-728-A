
yield <- read.csv("agronomic_yields.csv")

library(tidyverse)

glimpse(yield)

s <- summary(yield)
str(s)

sum(is.na(yield))

yield %>%
  summarise_all(funs(sum(is.na(.))))

yield %>%
  summarise_all(~sum(is.na(.)))

y <- yield %>%
  summarise_all(~sum(is.na(.)))

# 查看資料細節
glimpse(y)

y$Yield_kg_ha[1]

yield %>%
  summarise_all(~sum(is.na(.)) %>%
                  .[1, "Yield_kg_ha"])

yield_sum <- yield %>%
  group_by(description) %>%
  summarise(ave_y = mean(Yield_kg_ha, na.rm = TRUE),
            sd_y = sd(Yield_kg_ha, na.rm = TRUE),
            count = n()) %>%
  arrange(desc(ave_y))
  # its ok to write 
  # arrange(-(ave_y))

yield_sum
glimpse(yield_sum)

ggplot(data = yield) +
  geom_histogram((aes(x = Yield_kg_ha)))

ggplot(data = yield) +
  geom_histogram(aes(x = Yield_kg_ha, fill = "#998ec3"), #紫色柱狀圖
                 color = "black", alpha = 0.6) +
  theme_minimal()

ggplot(data = yield)+
  geom_histogram(aes(x = Yield_kg_ha, fill = Crop),
                 color = "black", alpha = 0.6) +
  theme_minimal() +
  scale_fill_brewer(palette = "RdYlBu")

                  
                  
                  
                  
                