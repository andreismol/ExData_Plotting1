power_consumption <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses = 
c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
power_consumption <- subset(power_consumption,Date=="1/2/2007"|Date=="2/2/2007")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
power_consumption$Time <- strptime(paste(power_consumption$Time,power_consumption$Date,sep=" "),format="%H:%M:%S %Y-%m-%d")
png(filename="plot3.png",width=480,height=480)
with(power_consumption,plot(Time, Sub_metering_1,ylab="Energy sub metering",xlab="",ylim=range(Sub_metering_1,Sub_metering_2,Sub_metering_3),
                            type="n"))
with(power_consumption,lines(Time,Sub_metering_1,col="black"))
with(power_consumption,lines(Time,Sub_metering_2,col="red"))
with(power_consumption,lines(Time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()