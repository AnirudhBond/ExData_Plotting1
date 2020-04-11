d <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
  
  ## Create column in table with date and time merged together
  FullTimeDate <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  d <- cbind(d, FullTimeDate)
  
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
  
  ## plot globalactivepower vs date&time
png("plot2.png", height = 480,width = 480)
  with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
  dev.off()
