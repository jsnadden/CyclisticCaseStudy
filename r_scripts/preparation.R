######################################################################
# IMPORT CLEANED DATA
initial_row_counts <- read_csv("./../cleaned_data/sql_table_row_counts.csv")
trip_data18q1 <- read_csv("./../cleaned_data/2018_Q1.csv")
trip_data18q2 <- read_csv("./../cleaned_data/2018_Q2.csv")
trip_data18q3 <- read_csv("./../cleaned_data/2018_Q3.csv")
trip_data18q4 <- read_csv("./../cleaned_data/2018_Q4.csv")
trip_data19q1 <- read_csv("./../cleaned_data/2019_Q1.csv")
trip_data19q2 <- read_csv("./../cleaned_data/2019_Q2.csv")
trip_data19q3 <- read_csv("./../cleaned_data/2019_Q3.csv")
trip_data19q4 <- read_csv("./../cleaned_data/2019_Q4.csv")

######################################################################
# CREATE AND FORMAT THE BIG TABLE
trip_data <- bind_rows(trip_data18q1, trip_data18q2, trip_data18q3,
                       trip_data18q4, trip_data19q1, trip_data19q2,
                       trip_data19q3, trip_data19q4)

trip_data <- create_duration_col(trip_data)
trip_data <- create_weekday_col(trip_data)
trip_data <- convert_col_types(trip_data)

trip_data <-  trip_data %>%
  mutate(usertype = recode(usertype,
                                 "Subscriber" = "member",
                                 "Customer" = "casual"))

trip_data <- trip_data[!trip_data$to_station_name == "HUBBARD ST BIKE CHECKING (LBS-WH-TEST)", ]

######################################################################
# OUTPUT THE BIG TABLE FOR LATER USE
write.csv(trip_data,file='./output/trip_data.csv', row.names=FALSE)

######################################################################
# CLEAN UP
rm(trip_data18q1,trip_data18q2,trip_data18q3,trip_data18q4,
   trip_data19q1,trip_data19q2,trip_data19q3,trip_data19q4)
gc()
######################################################################
