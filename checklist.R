## checklist.R creates a csv file containing the measurements of electric 
## power consumption. 
## "EPC.feb2007_01_02.csv" is a subset of the records from 
## February 1 and 2, 2007; filtered from "household_power_consumption.txt"
library(readr)
library(tidyverse)

# download and unzip file
if(!file.exists("./ExData_Plotting1/household_power_consumption.txt")){
        temp <- tempfile()
        urlHPC <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(urlHPC, temp, mode = "wb")
        unzip(temp, exdir = "./ExData_Plotting1")
        unlink(temp)
        rm(list = ls())
}

# if "EPC.feb2007_01_02.csv" doesn't exist, the file is created
if(!file.exists("./ExData_Plotting1/EPC.feb2007_01_02.csv")){
        read_delim(
                "./ExData_Plotting1/household_power_consumption.txt",
                delim = ";",
                col_types = cols(
                        Date = col_date(format = "%d/%m/%Y")
                ),
                na = c("", "NA", "?")) %>%
                filter(Date == "2007-02-01" | Date == "2007-02-02") %>%
                write_csv(file = "./ExData_Plotting1/EPC.feb2007_01_02.csv")
}

