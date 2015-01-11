# Project 1:plot2
# Reading entire data
data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
data_date<-data1[,"Date"]
colmn = "Global_active_power"
# Extract date wise Global Active Power
date_day1<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01",colmn]
date_day2<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02",colmn]
data_2days<-c(date_day1,date_day2)
num_data_2days<-as.numeric(data_2days)
#day1<-weekdays(as.Date("2007-02-01"))
#day2<-weekdays(as.Date("2007-02-02"))
#day3<-weekdays(as.Date("2007-02-03"))
#days<-c(day1,day2,day3)s
# plot histogram and save
plot(num_data_2days,type ="l",col ="black",xlab="",ylab = "Global Active Power (kilowatts)",xaxt ='n')
axis(side = 1, at = c(1,length(date_day1),length(data_2days)),labels = c("Thu","Fri","sat"))
axis(side = 2)
dev.copy(png,file="Plot2.png",width = 480, height = 480, units = "px")
dev.off()
