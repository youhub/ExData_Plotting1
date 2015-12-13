# plot1
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


png(file="plot1.png",width=480,height=480)
hist(select2$Global_active_power,main="Global Action Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()

