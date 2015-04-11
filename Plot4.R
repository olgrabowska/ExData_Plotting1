
#The code reads the data and creates the chart from it 
#according to the specification given in the Project 1 of 
#Exploratory data analysis course on Coursera.

#Plot 4

Sys.setlocale("LC_ALL","C")
#setwd("c:/Users/Ala/Desktop/Ola/Explorat")
data<-read.table('household_power_consumption.txt',header=T, sep=";",na.string="?")
data<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#Plot1
with(data, plot(DateTime,Global_active_power,
                ylab="Global Active Power",
                xlab="",
                type="l"))

#Plot2
with(data, plot(DateTime,Voltage,
                ylab="Voltage",
                xlab="datetime",
                type="l"))

#Plot3
#par(mfrow=c(1,1))
with(data, plot(DateTime,Sub_metering_1,
                ylab="Energy sub metering",
                xlab="",
                type="n"))
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
'legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex=0.5, col=c("black", "red", "blue"), 
       lty=1, lwd=0.2, bty="n",x.intersp=0)'

#Plot4
with(data, plot(DateTime,Global_reactive_power,
                ylab="Global_reactive_power",
                xlab="datetime",
                type="l"))
dev.off()

