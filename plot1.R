library(readr)
elec.power.cons <- read_csv("./ExData_Plotting1/EPC.feb2007_01_02.csv")
hist(elec.power.cons$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.copy(png, file = "./ExData_Plotting1/plot1.png")
dev.off()