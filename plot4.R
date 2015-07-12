plot4 <- function(){

# Downloading data
# ----------------
if(!file.exists("household_power_consumption.txt"))
	{
	temp <- tempfile()
	download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", temp)
	rawdata <- unzip(temp)
	unlink(temp)
 	print("File downloaded and unzipped successfully")
	}

# Reading and preprocessing the data
# ----------------------
	data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
	subdata <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"),]
	date_time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plotting plot 4
# ---------------
# Opening device and setting plt parameters
	png("plot4.png", width=480, height=480)
	par(mfrow = c(2,2))

# Plotting first chart
	plot(date_time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex.lab=0.75, cex.axis=0.75)

# Plotting second chart
	plot(date_time, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage", cex.lab=0.75, cex.axis=0.75)

# Plotting third chart
	plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="", cex.lab=0.75, cex.axis=0.75)
	lines(date_time, subdata$Sub_metering_2, col="red")
	lines(date_time, subdata$Sub_metering_3, col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=0.75)

# Plotting fourth chart
	plot(date_time, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex.lab=0.75, cex.axis=0.75)

# Closing device
	dev.off()	
	cat("Plot 4 has been successfully created and saved in ", getwd(), "\n")

# End of function
}