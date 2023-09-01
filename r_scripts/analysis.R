######################################################################
# PIVOT PER WEEKDAY
aveduration_ridecount_by_usertype_weekday <- trip_data %>% 
  mutate(weekday = wday(start_time, label = FALSE)) %>%
  group_by(usertype, weekday) %>%
  summarise(ridecount = n()
            ,aveduration = mean(duration)) %>%
  arrange(usertype, weekday)

write.csv(aveduration_ridecount_by_usertype_weekday,file='./output/aveduration_ridecount_by_usertype_weekday.csv', row.names=FALSE)

gc()

aveduration_ridecount_by_usertype_weekday %>% 
  ggplot(aes(x = weekday, y = ridecount, fill = usertype)) +
  geom_col(position = "dodge")

ggsave("./output/rides_by_usertype_weekday.png")

gc()

######################################################################
# PIVOT PER MONTH
aveduration_ridecount_by_usertype_month <- trip_data %>% 
  mutate(month = month(start_time, label = TRUE)) %>%
  group_by(usertype, month) %>%
  summarise(ridecount = n(),
            aveduration = mean(duration)) %>%
  arrange(usertype, month)

write.csv(aveduration_ridecount_by_usertype_month,file='./output/aveduration_ridecount_by_usertype_month.csv', row.names=FALSE)

gc()

aveduration_ridecount_by_usertype_month %>% 
  ggplot(aes(x = month, y = ridecount, fill = usertype)) +
  geom_col(position = "dodge")

ggsave("./output/rides_by_usertype_month.png")

gc()

######################################################################
# PIVOT PER TIME OF DAY
breaks <- hour(hm("00:00", "6:00", "12:00", "18:00", "23:59"))
labels <- c("Night", "Morning", "Afternoon", "Evening")

aveduration_ridecount_by_usertype_tod <- trip_data %>% 
  mutate(time_of_day = cut(x=hour(trip_data$start_time), breaks = breaks, labels = labels, include.lowest=TRUE)) %>%
  group_by(usertype, time_of_day) %>%
  summarise(ridecount = n(),
            aveduration = mean(duration)) %>%
  arrange(usertype, time_of_day)

write.csv(aveduration_ridecount_by_usertype_tod,file='./output/aveduration_ridecount_by_usertype_tod.csv', row.names=FALSE)

gc()

aveduration_ridecount_by_usertype_tod %>% 
  ggplot(aes(x = time_of_day, y = ridecount, fill = usertype)) +
  geom_col(position = "dodge")

ggsave("./output/rides_by_usertype_time_of_day.png")

gc()

######################################################################
# PIVOT PER AGE GROUP
breaks <- c(15, 30, 45, 60, 75, 90, 105)
labels <- c("15-30", "30-45", "45-60", "60-75", "75-90", "90+")

aveduration_ridecount_by_usertype_age <- trip_data %>% 
  mutate(age_group = cut(x=year(start_time) - birthyear, breaks = breaks, labels = labels, include.lowest=TRUE)) %>%
  group_by(usertype, age_group) %>%
  summarise(ridecount = n()
            ,aveduration = mean(duration)) %>%
  arrange(usertype, age_group)

aveduration_ridecount_by_usertype_age <- aveduration_ridecount_by_usertype_age[!is.na(aveduration_ridecount_by_usertype_age$age_group), ]

write.csv(aveduration_ridecount_by_usertype_age,file='./output/aveduration_ridecount_by_usertype_age.csv', row.names=FALSE)

gc()

aveduration_ridecount_by_usertype_age %>% 
  ggplot(aes(x = age_group, y = ridecount, fill = usertype)) +
  geom_col(position = "dodge") +
  scale_y_continuous(trans='log10')

ggsave("./output/rides_by_usertype_age.png")

gc()

######################################################################
#