plot2 <- function(){

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

# Plotting plot 2
# ---------------
	png("plot2.png", width=480, height=480)
	plot(date_time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()	
	cat("Plot 2 has been successfully created and saved in ", getwd(), "\n")
	

# End of function
}