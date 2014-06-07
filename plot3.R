plot3 <- function() {
  #Uncomment code below if you are missing the required package
  #install.packages("sqldf")
  library(sqldf)
  
  # Filename
  file <- "exdata-data-household_power_consumption/household_power_consumption.txt"
  
  #Read in subset of data
  data <- read.csv.sql(file, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', colClasses=c("character", "character", rep("numeric",7)), sep=";")
  
  #Format Datetime
  datetime <- paste(data$Date, data$Time)
  datetime <- as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S"))
  
  #Bind to Data
  data <- cbind(data, datetime)

  #Generate PDF of Plot
  png("plot3.png", height=480, width=480)
  plot(data$Sub_metering_1 ~ data$datetime, type="l", xlab="", ylab="Energy sub metering")
  lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
  lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
  legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
}