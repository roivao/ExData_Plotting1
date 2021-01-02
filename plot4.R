library(readr)
library(dplyr)

elec.power.cons <- read_csv("./ExData_Plotting1/EPC.feb2007_01_02.csv") %>%
        mutate( Date_Time = parse_datetime(paste(Date,Time)) )
with(elec.power.cons, {
        par(mfrow = c(2,2), oma = c(0,0,0,0), mar = c(3, 4, 2, 1) + 0.1 )
        plot(Date_Time, Global_active_power,
             type = "l",
             xlab = "", ylab = "Global Active Power")
        plot(Date_Time, Voltage,
             type = "l",
             xlab = "", ylab = "Voltage")
        plot(Date_Time, Sub_metering_1,
             type = "l",
             xlab = "", ylab = "Energy sub metering")
        lines(Date_Time, Sub_metering_2, col = "red")
        lines(Date_Time, Sub_metering_3, col = "blue")
        legend(x = "topright", 
               lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               adj = c(0,0), bty = "n", cex = 0.8, inset = 0)
        plot(Date_Time, Global_reactive_power,
             type = "l",
             xlab = "", ylab = "Global Reactive Power")
})
dev.copy(png, fil = "./ExData_Plotting1/plot4.png")
dev.off()