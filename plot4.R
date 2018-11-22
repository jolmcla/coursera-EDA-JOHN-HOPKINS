#Author Jose Luis Del Olmo
#*********************************************************************
#plot 4
# read data
data <- read.csv("household_power_consumption.txt",sep=";",colClasses=c(rep("character",2),rep("numeric",7)),na.strings="?")

# add timestapm
data$ts <- strptime(paste(data$Date,data$Time),
                           format="%d/%m/%Y %H:%M:%S")
# filter by date
dataforplot= subset(data,as.Date(data$ts) >= "2007-02-01" & as.Date(data$ts) < "2007-02-03")

# open png
png(filename="plot4.png", height=480, width=480, bg="transparent")

# create the frame
par(mfrow=c(2,2))
#  plot 1

plot(dataforplot$ts,dataforplot$Global_active_power, type="l",xlab="",ylab="Global Active Power")

# plot 2 - voltage vs time

plot(dataforplot$ts,dataforplot$Voltage,type="l",xlab="datetime",ylab="Voltage")

# plot 3 

# subplot 1
plot(dataforplot$ts,dataforplot$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")

# subplot 2
lines(dataforplot$ts,dataforplot$Sub_metering_2,type="l",col="red")

# subplot 3
lines(dataforplot$ts,dataforplot$Sub_metering_3,type="l",col="blue")


legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"),bty="n")

# plot 4

plot(dataforplot$ts,dataforplot$Global_reactive_power,type="l",xlab="datetime",
ylab="Global_reactive_power")

dev.off()