# plot 4
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", mode="wb") # mode wb works for windows
unzip("power.zip")


power_consumption<-read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
power_consumption$Date<-as.character(power_consumption$Date)
power_consumption$Time<-as.character(power_consumption$Time)
power_consumption$DateAndTime<-as.POSIXct(paste(power_consumption$Date, power_consumption$Time), format="%d/%m/%Y%H:%M:%S")
power_consumption$Date<-as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$Time<-as.POSIXct(power_consumption$Time, format="%H:%M:%S")

power_consumption$Global_active_power<-as.numeric(power_consumption$Global_active_power)
power_consumption$Global_reactive_power<-as.numeric(power_consumption$Global_reactive_power)
power_consumption$Voltage<-as.numeric(power_consumption$Voltage)
power_consumption$Global_intensity<-as.numeric(power_consumption$Global_intensity)
power_consumption$Sub_metering_1<-as.numeric(power_consumption$Sub_metering_1)
power_consumption$Sub_metering_2<-as.numeric(power_consumption$Sub_metering_2)
power_consumption$Sub_metering_3<-as.numeric(power_consumption$Sub_metering_3)

select1<-power_consumption[power_consumption$Date>="2007-02-01",]
select2<-select1[select1$Date<="2007-02-02",]


#4.1
png(file="plot4.png",width=480,height=480)
par(mfrow = c(2, 2))
plot(Global_active_power~DateAndTime, select2, type="l",xlab="", ylab="Global Active Power")

#4.2
plot(Voltage~DateAndTime, select2, type="l", xlab="datetime")

#4.3

with(select2, plot(DateAndTime, Sub_metering_1, type="l",col="black", ylab="Energy sub metering", xlab=""))
with(select2, lines(DateAndTime, Sub_metering_2, type="l",col="red"))
with(select2, lines(DateAndTime, Sub_metering_3, type="l",col="blue"))

legend("topright",  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))

#4.4
plot(Global_reactive_power~DateAndTime, select2, type="l", xlab="datetime")
dev.off()





