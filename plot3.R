plot3 <- function(){

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

# Plotting plot 3
# ---------------
	png("plot3.png", width=480, height=480)
	plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
	lines(date_time, subdata$Sub_metering_2, col="red")
	lines(date_time, subdata$Sub_metering_3, col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
	dev.off()	
	cat("Plot 3 has been successfully created and saved in ", getwd(), "\n")

# End of function
}