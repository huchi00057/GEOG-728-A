library(spData)
library(RColorBrewer)
library(ggplot2)
library(sf)


data <- read.csv("GlobalLandTemperaturesByState.csv")

summary(data)
head(data)

subset_data <- subset(data, Country == "United States")
subset_data


subset_data <- subset_data[complete.cases(subset_data$AverageTemperature), ]
subset_data


subset_data$dt <- as.Date(subset_data$dt)

# filter data from 2010-2013
filtered_data <- subset(subset_data, dt >= as.Date("2010-01-01") & dt <= as.Date("2013-12-31"))

us_states <- spData::us_states

merged_data <- merge(us_states, filtered_data, by.x = "NAME", by.y = "State", all.x = TRUE)


### 到這裡
ggplot() +
  geom_sf(data = merged_data, aes(fill = AverageTemperature)) +
  scale_fill_gradientn(colors = brewer.pal(9, "RdBu"), name = "Average Temperature") +
  theme_minimal() +
  labs(title = "Average Temperature by State")




