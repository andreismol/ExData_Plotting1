power_consumption <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses = 
c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
power_consumption <- subset(power_consumption,Date=="1/2/2007"|Date=="2/2/2007")
power_consumption$Date <- as.Date(power_consumption$Date,format="%d/%m/%Y")
power_consumption$Time <- strptime(paste(power_consumption$Time,power_consumption$Date,sep=" "),format="%H:%M:%S %Y-%m-%d")
png(filename="plot2.png",width=480,height=480)
plot(power_consumption$Time,power_consumption$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type = "n")
lines(power_consumption$Time,power_consumption$Global_active_power)
dev.off()