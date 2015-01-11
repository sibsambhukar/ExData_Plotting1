# Project 1
# Reading entire data
data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
data_date<-data1[,"Date"]
colmn = "Global_active_power"
# Extract date wise Global Active Power
date_day1<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01",colmn]
date_day2<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02",colmn]
data_2days<-c(date_day1,date_day2)
num_data_2days<-as.numeric(data_2days)
# plot histogram and save
hist(num_data_2days,col ="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.copy(png,file="Plot1.png",width = 480, height = 480, units = "px")
dev.off()

