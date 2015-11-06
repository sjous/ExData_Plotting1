#Plot 4

#load dplyr
library(dplyr)

#Read data, filter and create new variable "Datetime"
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) %>%
        tbl_df %>%
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Datetime = paste(power$Date, power$Time))

#Convert Datetime to something useful
power$Datetime <- strptime(power$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Make plot 4. Note that this will overwrite "plot4.png" if you already have one in your working directory!
png(file = "plot4.png", height = 480, width = 480)
par(mfrow = c(2,2), mar = c(3, 5, 3, 1))

with(power, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(power, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(power, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
with(power, points(Datetime, Sub_metering_2, type = "l", col = "red"))
with(power, points(Datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(power, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()