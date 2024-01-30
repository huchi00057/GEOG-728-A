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


