# John S. Anvik, 2025  
# University of Lethbridge Student ID: 001224816

# Import packages
library(tidyverse)

# Load in the data
rawdata <- read_csv("data/megazord.csv")

# Filter to columns we care about
data <- rawdata %>% 
    filter(Data_Class == "song") %>% 
    select(ID, DateTime, time_rel_sunrise, UST, Location_Number, neighbourhood, number_of_matches) %>% 
    arrange(desc("date"))

head(data)