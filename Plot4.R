
setwd("C:/Users/clorenzini/Desktop/Coursera/Exploratory Data Analysis")

data<-read.delim("household_power_consumption.txt",sep=";",header=T,na.strings="?")

set1<-data[which(data$Date=="1/2/2007"),]
set2<-data[which(data$Date=="2/2/2007"),]

set<-rbind(set1,set2)

x<-set$Global_active_power
x1<-set$Sub_metering_1
x2<-set$Sub_metering_2
x3<-set$Sub_metering_3
x4<-set$Voltage
x5<-set$Global_reactive_power

tdate <- strptime(paste(set$Date, set$Time), format='%d/%m/%Y %H:%M:%S')

par(mfrow=c(2,2))
plot(tdate,x,type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(tdate,x4,type="l",ylab="Voltage",xlab="datetime")
plot(tdate,x1,type="l",xlab="",ylab="Energy sub metering")
lines(tdate,x2,type="l",col="red")
lines(tdate,x3,type="l",col="blue")
legend("topright",bty="n",cex=0.7,col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(tdate,x5,type="l",ylab="Global_reactive_power",xlab="datetime")


dev.copy(png,file="plot4.png",width = 480, height = 480)

dev.off()