# Project 1:plot3
# Reading entire data
data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
data_date<-data1[,"Date"]
colmn1 = "Sub_metering_1"
colmn2 = "Sub_metering_2"
colmn3 = "Sub_metering_3"

# Extract date wise Global Active Power
date_day1_sm1<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01",colmn1]
date_day2_sm1<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02",colmn1]
data_2days_sm1<-c(date_day1_sm1,date_day2_sm1)
num_data_2days_sm1<-as.numeric(data_2days_sm1)

date_day1_sm2<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01",colmn2]
date_day2_sm2<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02",colmn2]
data_2days_sm2<-c(date_day1_sm2,date_day2_sm2)
num_data_2days_sm2<-as.numeric(data_2days_sm2)

date_day1_sm3<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01",colmn3]
date_day2_sm3<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02",colmn3]
data_2days_sm3<-c(date_day1_sm3,date_day2_sm3)
num_data_2days_sm3<-as.numeric(data_2days_sm3)
# Plot
x_seq <-seq(1:length(num_data_2days_sm3))
plot(x_seq,num_data_2days_sm1,type="l",col="grey",xlab="",ylab="Energy sub metering",xaxt='n')
lines(x_seq,num_data_2days_sm2,type="l",col="red")
lines(x_seq,num_data_2days_sm3,type="l",col="blue")
legend("topright",col=c("grey","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

axis(side = 1, at = c(1,length(date_day1_sm3),length(num_data_2days_sm3)),labels = c("Thu","Fri","sat"))
axis(side = 2)
dev.copy(png,file="Plot3.png",width = 480, height = 480, units = "px")
dev.off()
