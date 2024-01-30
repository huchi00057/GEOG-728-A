jn <- read.csv("C:/Users/huchi/.git/test/GEOG-728-A/0125/0125/journeynorth.csv")
jn2 <- read.csv("C:/Users/huchi/.git/test/GEOG-728-A/0125/0125/journeynorth2.csv")

jn_full <- rbind(jn, jn2)

pets <- c('cats','dogs', 'goldfish')
quality <- c(42, 500, 1)

get_df <- data.frame(pets, quality)
head(get_df)

my_list <- c(get_df, jn_full)
str(my_list)

my_list <- list(get_df, jn_full)

str(my_list)

my_list[1]

my_list[[1]]

my_list[1]$pets

my_list[[1]]$pets

my_list[1][2]

my_list[[1]][1]

my_list[[1]][1,2]

get_df[1,2]

my_list[[1]]

my_list[[1]][get_df$pets == "dogs", 2]

unique(jn_full$Town)

length(unique(jn_full$Town))

jn_manhat <- jn_full[jn_full$Town == "Manhattan", ]

head(jn_manhat)

unique(jn_manhat$State.Province)

jn_manhat <- jn_full[jn_full$Town == "Manhattan" & jn_full$State.Province == "KS",]

tot_manhat <-sum(jn_manhat$Number)
tot_manhat

tot_all <- sum(jn_full$Number, na.rm = TRUE)
tot_all

percent_manhat <- tot_manhat/tot_all*100
percent_manhat

jn_law <- subset(jn_full, jn_full$Town == "Lawrence")
head(jn_law)
length(jn_law)

is.na(jn_full)

head(is.na(jn_full))

any(is.na(jn_full)) # output would be Boolean

sum(is.na(jn_full))

sapply(jn_full, function(x) sum(is.na(x)))

jn_nona <- jn_full[!is.na(jn_full$Number), ]
head(jn_nona)

jn_gp <- jn_nona[jn_nona$State.Province %in% c("KS", "NE", "OK", "MO"), ]
jn_gp <- jn_nona[jn_nona$State == "KS" | jn_nona$State == "NE", ]

list_o_states <- c("KS", "NE", "OK", "MO")
list_o_states <- jn_nona[jn_nona$State.Province %in% list_o_states, ]

plot(jn_full)

hist(jn_full$Number, breaks =100)

hist(log(jn_full$Number, breaks = 100))

plot(jn_nona$State.Province, jn_nona$Number)

class(jn_nona$State.Province)

plot(as.factor(jn_nona$State.Province), jn_nona$Number)

plot(as.factor(jn_gp$State.Province), jn_gp$Number)


library(tidyverse)

glimpse(jn_full)

jn_nona <- jn_full %>% filter(!is.na(Number))

head(jn_nona)

jn_su <- jn_full %>% select(Town, Number)

head(jn_su)
