#Downloading and unzipping data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "powercons.zip")
unzip("powercons.zip")

#Reading file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Date and Time as a single variable that is easier to use
hpc$Date.Time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

#Only data from 2007-02-01 and 2007-02-02
hpc2 <- hpc[(as.Date(hpc$Date.Time) == as.Date("2007-02-01") | as.Date(hpc$Date.Time) == as.Date("2007-02-02")),]

#The plot
png(filename = "plot4.png", bg = "transparent")
par(mfrow = c(2,2))

#Subplot 1
plot(x = hpc2$Date.Time, y = hpc2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#Subplot 2
plot(x = hpc2$Date.Time, y = hpc2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Subplot 3 (Same as plot3.R, but without box around legend)
plot(x = hpc2$Date.Time, hpc2[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = hpc2$Date.Time, hpc2[,8], col = "red")
lines(x = hpc2$Date.Time, hpc2[,9], col = "blue")
legend("topright", legend = colnames(hpc2[,7:9]), col = c("black", "red", "blue"), lty = 1, bty = "n")

#Subplot 4
plot(x = hpc2$Date.Time, y = hpc2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()