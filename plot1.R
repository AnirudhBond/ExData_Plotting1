d <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

## change class of all columns to correct class
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
d$Time <- format(d$Time, format="%H:%M:%S")
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
d$Voltage <- as.numeric(d$Voltage)
d$Global_intensity <- as.numeric(d$Global_intensity)
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(d, Date == "2007-02-01" | Date =="2007-02-02")

## plot 1
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()