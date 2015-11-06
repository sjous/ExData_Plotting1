#Plot 3

#load dplyr
library(dplyr)

#read data, filter and create new variable "Datetime"
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) %>%
        tbl_df %>%
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Datetime = paste(power$Date, power$Time))

#Convert Datetime to something useful
power$Datetime <- strptime(power$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Make plot 3. Note that this will overwrite "plot3.png" if you already have one in your working directory!
png(file = "plot3.png", height = 480, width = 480)
plot(power$Datetime, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
points(power$Datetime, power$Sub_metering_2, type = "l", col = "red")
points(power$Datetime, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()