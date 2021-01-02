library(readr)
library(dplyr)

elec.power.cons <- read_csv("./ExData_Plotting1/EPC.feb2007_01_02.csv") %>%
        mutate( Date_Time = parse_datetime(paste(Date,Time)))
with(elec.power.cons, {
        plot(Date_Time, Sub_metering_1, type = "n",
             xlab = "", ylab = "Sub metering")
        lines(Date_Time, Sub_metering_1, col = "black")
        lines(Date_Time, Sub_metering_2, col = "red")
        lines(Date_Time, Sub_metering_3, col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"),
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               adj = c(0,0), bty = "o", cex = 0.6, inset = 0)
})
dev.copy(png, file = "./ExData_Plotting1/plot3.png")
dev.off()