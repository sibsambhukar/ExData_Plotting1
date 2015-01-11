
# 
data1<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")
data_date<-data1[,"Date"]

#Plot Global_active_power
#colmn1 = "Global_active_power"
date_day1<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01","Global_active_power"]
date_day2<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02","Global_active_power"]
data_2days<-c(date_day1,date_day2)
num_data_2days<-as.numeric(data_2days)

#Plot Voltage
#colmn = "Voltage"
date_day1v<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01","Voltage"]
date_day2v<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02","Voltage"]
data_2daysv<-c(date_day1v,date_day2v)
num_data_2daysv<-as.numeric(data_2daysv)

#Plot Energy sub metering
colmn1 = "Sub_metering_1"
colmn2 = "Sub_metering_2"
colmn3 = "Sub_metering_3"
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


#Plot Global_reactive_power
#colmn = "Global_reactive_power"
date_day1r<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-01","Global_reactive_power"]
date_day2r<-data1[as.Date(strptime(data_date,format='%d/%m/%Y'))=="2007-02-02","Global_reactive_power"]
data_2daysr<-c(date_day1r,date_day2r)
num_data_2daysr<-as.numeric(data_2daysr)


par(mfrow=c(2,2))
# plot histogram and save
plot(num_data_2days,type ="l",col ="black",xlab="",ylab = "Global Active Power (kilowatts)",xaxt ='n')
axis(side = 1, at = c(1,length(date_day1),length(data_2days)),labels = c("Thu","Fri","sat"))
axis(side = 2)

plot(num_data_2daysv,type ="l",col ="black",xlab="",ylab = "Voltage",xaxt ='n')
axis(side = 1, at = c(1,length(date_day1),length(data_2days)),labels = c("Thu","Fri","sat"))
axis(side = 2)

x_seq <-seq(1:length(num_data_2days_sm3))
plot(x_seq,num_data_2days_sm1,type="l",col="grey",xlab="",ylab="Energy sub metering",xaxt='n')
lines(x_seq,num_data_2days_sm2,type="l",col="red")
lines(x_seq,num_data_2days_sm3,type="l",col="blue")
#legend("topright",col=c("grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=0.2,cex=0.5, bty="n", xjust=.5, seg.len=0.25)
axis(side = 1, at = c(1,length(date_day1_sm3),length(num_data_2days_sm3)),labels = c("Thu","Fri","sat"))
axis(side = 2)
plot(num_data_2daysr,type ="l",col ="black",xlab="",ylab = "Global_reactive_Power",xaxt ='n')
axis(side = 1, at = c(1,length(date_day1),length(data_2days)),labels = c("Thu","Fri","sat"))
axis(side = 2)

dev.copy(png,file="Plot4.png",width = 480, height = 480, units = "px")
dev.off()
