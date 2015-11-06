#Plot 1

#load dplyr
library(dplyr)

#read data, filter and create new variable "Datetime"
power <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")) %>%
        tbl_df %>%
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(Datetime = paste(power$Date, power$Time))

#Convert Datetime to something useful
power$Datetime <- strptime(power$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Make plot 1. Note that this will overwrite "plot1.png" if you already have one in your working directory!
png(file = "plot1.png", height = 480, width = 480)
hist(power$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()