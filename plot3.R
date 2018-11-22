#Author Jose Luis Del Olmo
#*********************************************************************
#plot 3
# read data
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

dataforplot <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))  
# add timestamp
dataforplot$ts <- strptime(paste(dataforplot$Date,dataforplot$Time),format="%d/%m/%Y %H:%M:%S")
# open png
png(filename="plot3.png", height=480, width=480, bg="transparent")

# first
plot(dataforplot$ts,dataforplot$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

# second
lines(dataforplot$ts,dataforplot$Sub_metering_2,type="l",col="red")

# third
lines(dataforplot$ts,dataforplot$Sub_metering_3,type="l",col="blue")

legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=2,col=c("black","red","blue"))
dev.off()