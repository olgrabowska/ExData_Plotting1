
#The code reads the data and creates the chart from it 
#according to the specification given in the Project 1 of 
#Exploratory data analysis course on Coursera.

#Plot 3

Sys.setlocale("LC_ALL","C")
setwd("c:/Users/Ala/Desktop/Ola/Explorat")
data<-read.table('household_power_consumption.txt',header=T, sep=";",na.string="?")
data<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480)

with(data, plot(DateTime,Sub_metering_1,
                ylab="Energy sub metering",
                xlab="",
                type="n"))
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()