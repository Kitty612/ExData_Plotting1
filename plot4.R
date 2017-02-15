#plot4
source('~/source the data.R')

par(mfrow = c(2,2))

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime)

#1st plot
plot(data2$Global_active_power~data2$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#2nd plot
data2[, "Voltage"] <- as.numeric(data2[, "Voltage"])
plot(data2$Voltage~data2$DateTime, type = "l", ylab = "Voltage", xlab = "datetime")

#3rd plot
with(data2, {
  plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy sub metering", xlab = "") 
  lines(Sub_metering_2~DateTime, col = 'Red')
  lines(Sub_metering_3~DateTime, col = 'Blue')
})
legend("topright", lwd = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.6)

#4th plot
data2[, "Global_reactive_power"] <- as.numeric(data2[, "Global_reactive_power"])
plot(data2$Global_reactive_power~data2$DateTime, type = "s", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()