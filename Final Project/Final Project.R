library(dplyr)
library(ggplot2)
library(tidyr)
library(sf)


used_car <- read.csv("Final Project.csv")

# Assessing Data
head(used_car)
dim(used_car)
names(used_car)
glimpse(used_car)

# make sure whether there is NA value in data.
sum(is.na(used_car))

### 從這裡
used_car$year <- as.Date(paste0(used_car$year, "-01-01"))

filtered_data <- used_car %>%
  filter(year >= as.Date("2010-01-01") & year <= as.Date("2013-12-31") & state != "")

str(filtered_data)


us_states <- spData::us_states

abbreviate_states <- read.csv("states.csv")

abbreviate_states$Abbreviation <- tolower(abbreviate_states$Abbreviation)

with_states <- merge(filtered_data, abbreviate_states, by.x = "state", by.y = "Abbreviation", all.x = TRUE)

# merged_data2$full_state <- ifelse(is.na(merged_data2$State), merged_data2$state, merged_data2$State)

merged_data_used_car <- merge(us_states, with_states, by.x = "NAME", by.y = "State", all.x = TRUE)

ggplot() +
  geom_sf(data = merged_data_used_car, aes(fill = price)) +
  scale_fill_gradientn(colors = brewer.pal(9, "RdBu"), name = "Average Price") +
  theme_minimal() +
  labs(title = "Average Price by State")


# According to years
base_plot <- ggplot() +
  geom_sf(data = merged_data_used_car, aes(fill = price)) +
  scale_fill_gradientn(colors = brewer.pal(9, "RdBu"), name = "Price", limits = c(20000, 40000)) +
  theme_minimal() +
  labs(title = "Used Car Prices by State")

facet_plot <- base_plot +
  facet_wrap(~format(year, "%Y"), ncol = 3)

print(facet_plot)


########################

major_cities <- read.csv("USA_Major_Cities.csv")

# Filter major cities based on longitude and latitude
filtered_major_cities <- major_cities %>%
  filter(X >= -130 & Y <= 50 & Y >= 22)

filtered_city_sf <- st_as_sf(filtered_major_cities, coords = c("X", "Y"), crs = st_crs(us_states))

merged_data <- st_join(us_states, filtered_city_sf)

# Plot the US map with filtered cities as points
ggplot() +
  geom_sf(data = merged_data, fill = "lightblue", color = "black") +  # US states
  geom_sf(data = filtered_city_sf, color = "red", size = 0.5) +  # Filtered cities as points
  theme_minimal() +
  labs(title = "Cities on US Map")

# Count the number of cities for each state
city_counts <- merged_data %>%
  group_by(NAME.x) %>%
  summarize(number_of_cities = n())

# Print the city counts for each state
print(city_counts)


ggplot(city_counts) +
  geom_sf(aes(fill = number_of_cities)) +
  theme_minimal() +
  labs(title = "Number of Cities in Each State", fill = "Number of Cities") +
  theme(legend.position = "right")

##################################不重要

ggplot() +
  geom_sf(data = merged_data, fill = "lightblue", color = "black") +  # US states
  geom_sf(data = merged_data_used_car, aes(fill = price)) +
  geom_sf(data = filtered_city_sf, color = "red", size = 0.2) +  # Filtered cities as points
  theme_minimal() +
  labs(title = "Cities on US Map")
######################################



ggplot(city_counts) +
  geom_bar(aes(x = reorder(NAME.x, -number_of_cities), y = number_of_cities), stat = "identity", fill = "lightblue") +
  theme_minimal() +
  labs(title = "Number of Cities in Each State", x = "State", y = "Number of Cities") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot() +
  geom_sf(data = us_states, fill = "lightblue", color = "black") + 
  geom_sf_text(data = city_counts, aes(label = number_of_cities, geometry = geometry), size = 3) +  # Add text labels for city counts
  theme_minimal() +
  labs(title = "Cities on US Map")


ggplot() +
  geom_sf(data = us_states, aes(fill = city_counts$number_of_cities), color = "black") +
  geom_sf_text(data = city_counts, aes(label = number_of_cities, geometry = geometry), size = 3) +  # Add text labels for city counts
  scale_fill_gradient(low = "blue", high = "yellow") +  # Define fill color gradient
  theme_minimal() +
  labs(title = "Cities on US Map")
#############


# caluculate the density from states
city_counts <- city_counts %>%
  mutate(state_area = st_area(geometry)) %>%
  mutate(city_density = number_of_cities / state_area)

# Convert city_density to numeric without units
city_counts$city_density <- as.numeric(city_counts$city_density)

###
city_density_data <- city_counts[, c("NAME.x", "city_density")]

us_states <- merge(us_states, city_density_data, by.x = "NAME", by.y = "NAME.x", all.x = TRUE)

# quantity
ggplot() +
  geom_sf(data = us_states, aes(fill = city_density), color = "black") +
  geom_sf_text(data = city_counts, aes(label = number_of_cities, geometry = geometry), size = 3) +  # Add text labels for city counts
  scale_fill_gradient(low = "blue", high = "red") +  # Define fill color gradient
  theme_minimal() +
  labs(title = "City Density on US Map")


# density
ggplot() +
  geom_sf(data = city_counts, aes(fill = city_density), color = "black") +
  scale_fill_gradient(low = "green", high = "red") +  
  theme_minimal() +
  labs(title = "City Density by State")

#########


# 按城市密度降序排列并取前十名州
top_states <- city_counts %>%
  arrange(desc(city_density)) %>%
  slice_head(n = 20)

# 绘制地图
ggplot() +
  geom_sf(data= us_states) +
  geom_sf(data = top_states, aes(fill = city_density), color = "black") 
  











