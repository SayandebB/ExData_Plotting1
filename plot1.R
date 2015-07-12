plot1 <- function(){

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

# Plotting plot 1
# ---------------
	subdata <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"),]
	png("plot1.png", width=480, height=480)
	hist(subdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()	
	cat("Plot 1 has been successfully created and saved in ", getwd(), "\n")

# End of function
}