
#The code reads the data and creates the chart from it 
#according to the specification given in the Project 1 of 
#Exploratory data analysis course on Coursera.

#Plot 2

Sys.setlocale("LC_ALL","C")
setwd("c:/Users/Ala/Desktop/Ola/Explorat")
data<-read.table('household_power_consumption.txt',header=T, sep=";",na.string="?")
data<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

png(filename="plot2.png", width=480, height=480)
data$DateTime<-paste(data$Date, data$Time, sep=" ")
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

with(data, plot(DateTime,Global_active_power,
                ylab="Global Active Power (kilowatts)",
                xlab="",
                type="l"))

dev.off()

