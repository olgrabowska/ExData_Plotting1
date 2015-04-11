
#The code reads the data and creates the chart from it 
#according to the specification given in the Project 1 of 
#Exploratory data analysis course on Coursera.

#Plot 1

Sys.setlocale("LC_ALL","C")
setwd("c:/Users/Ala/Desktop/Ola/Explorat")
data<-read.table('household_power_consumption.txt',header=T, sep=";",na.string="?")
data<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
data$Date<-as.Date(strptime(data$Date, "%d/%m/%Y"))

png(filename="plot1.png", width=480, height=480)
with(data, hist(Global_active_power, main="Global Active Power", col="red",
                xlab="Global Active Power (kilowatts)",
                ylab="Frequency"
))
dev.off()
