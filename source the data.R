#source the data
data1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data2 <- subset(data1, Date == as.Date("2007-2-1") | Date == as.Date("2007-2-2"))
data2[, "Global_active_power"] <- as.numeric(data2[, "Global_active_power"])
data2 <- data2[complete.cases(data2), ]
