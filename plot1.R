#*******************************************************************
#Title plot1.R
#Date  1/11/2015
#Author Jose Luis Del Olmo
#*********************************************************************
#plot 1
  data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",colClasses = c(rep("character",2), rep("numeric",7)),na.strings = "?")
  dataforplot <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))  
# open png 
  png(filename = "plot1.png",  height = 480, width = 480)

  # histogram for Global Active Power
  hist(dataforplot$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
  dev.off()



  