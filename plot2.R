library(readr)
library(dplyr)

elec.power.cons <- read_csv("./ExData_Plotting1/EPC.feb2007_01_02.csv") %>%
        mutate( Date_Time = parse_datetime(paste(Date,Time)))

with(elec.power.cons, plot(Date_Time, Global_active_power,
                           xlab = "",
                           ylab = "Global Active Power (kilowatts)",
                           type = "l"))
dev.copy(png, file = "./ExData_Plotting1/plot2.png")
dev.off()