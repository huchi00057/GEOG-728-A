
used_car <- read.csv("final_data.csv")

# Exploratory Data Analysis
summary(used_car)
summary(used_car$price)
summary(used_car$odometer)


ggplot(used_car, aes(x = condition, y = price)) +
  geom_boxplot(fill = "lightgreen") +


ggplot(used_car, aes(x = manufacturer)) +
  geom_bar(fill = "lightblue") +
  labs(title = "Number of Cars by Manufacturer", x = "Manufacturer", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


ggplot(used_car, aes(x = odometer, y = price)) +
  geom_point(color = "darkred") +
  labs(title = "Relationship between Odometer and Price", x = "Odometer (miles)", y = "Price ($)")


# Check for missing values
colSums(is.na(used_car))

# Handle missing values (e.g., impute with mean)
used_car$price[is.na(used_car$price)] <- mean(used_car$price, na.rm = TRUE)


# Visualize outliers using boxplots
ggplot(used_car, aes(x = condition, y = price)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Price Distribution by Condition", x = "Condition", y = "Price ($)")

# Decide how to handle outliers (e.g., remove or transform)


cor(used_car[, c("price", "odometer")])



used_car %>%
  group_by(manufacturer) %>%
  summarise(mean_price = mean(price))


# Check for unique values in categorical variables
unique(used_car$manufacturer)
unique(used_car$condition)
