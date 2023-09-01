######################################################################
# INCLUDES
library(tidyverse)
library(lubridate)
library(ggplot2)

######################################################################
# MACROS
`%notin%` <- Negate(`%in%`)

######################################################################
# FUNCTIONS
create_duration_col <- function(df){
  if("duration" %notin% names(df))
  {
    df <- df %>% 
      add_column(duration = 0)
  }
  df <- df %>% 
    mutate(duration = signif(difftime(end_time, start_time), digits = 4))
  return(df)
}

create_weekday_col <- function(df){
  if("weekday" %notin% names(df))
  {
    df <- df %>% 
      add_column(weekday = "")
  }
  df <- df %>% 
    mutate(weekday = wday(df$start_time, label=TRUE))
  return(df)
}

convert_col_types <- function(df){
  if("trip_id" %in% names(df))
  {
    df <-  mutate(df, trip_id = as.character(trip_id))
  }
  if("bikeid" %in% names(df))
  {
    df <-  mutate(df, bikeid = as.character(bikeid))
  }
  if("duration" %in% names(df))
  {
    df <-  mutate(df , duration = as.numeric(duration))
  }
  if("from_station_id" %in% names(df))
  {
    df <-  mutate(df , from_station_id = as.character(from_station_id))
  }
  if("to_station_id" %in% names(df))
  {
    df <-  mutate(df , to_station_id = as.character(to_station_id))
  }
  return(df)
}
######################################################################
