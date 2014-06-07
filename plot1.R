plot1 <- function() {
  #Uncomment code below if you are missing the required package
  #install.packages("sqldf")
  library(sqldf)
  
  # Filename
  file <- "exdata-data-household_power_consumption/household_power_consumption.txt"
  
  #Read in subset of data
  data <- read.csv.sql(file, sql = 'select * from file where Date="1/2/2007" OR Date="2/2/2007"', colClasses=c("character", "character", rep("numeric",7)), sep=";")

  #Format Date
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  
  #Generate PDF of Histogram
  png("plot1.png", height=480, width=480)
  hist(data$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
}