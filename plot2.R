#Author Jose Luis Del Olmo
#*********************************************************************
#plot 2
# read data
  data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = c(rep("character",2), rep("numeric",7)),na.strings = "?")
  dataforplot2 <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

  # add timestamp
    dataforplot2$ts <- strptime(paste(dataforplot2$Date, dataforplot2$Time), "%d/%m/%Y %H:%M:%S")
  # open png 
  png(filename = "plot2.png",  height = 480, width = 480)
  # plot 
  plot(dataforplot2$ts,dataforplot2$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
  dev.off()



  