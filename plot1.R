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
png(filename = "plot1.png", bg = "transparent")
hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()