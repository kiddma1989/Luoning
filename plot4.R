#read file

temp<-read.table('household_power_consumption.txt',header = TRUE,sep = ';')

#subset data

data<-temp[temp$Date%in%c('1/2/2007','2/2/2007'),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$temp<-strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

GlobalActivePower<-as.numeric(paste(data$Global_active_power))

Voltage<-as.numeric(paste(data$Voltage))

GlobalReactivePower<-as.numeric(paste(data$Global_reactive_power))

SubMetering1<-as.numeric(paste(data$Sub_metering_1))
SubMetering2<-as.numeric(paste(data$Sub_metering_2))
SubMetering3<-as.numeric(paste(data$Sub_metering_3))

#Plot4

par(mfrow = c(2,2))

plot(data$temp,GlobalActivePower,type = 'l',xlab = '',ylab = 'Global Active Power',main = '')

plot(data$temp,Voltage,type = 'l',xlab = 'datetime',ylab = 'Voltage',main = '')

plot(data$temp,SubMetering1,type = 'l',col = 'black',xlab = '',ylab = 'Energy sub metering',main = '')
lines(data$temp,SubMetering2,col = 'red')
lines(data$temp,SubMetering3,col = 'blue')
legend('topright',lty = 1,col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_Metering_3'),bty = 'n',cex=0.8)

plot(data$temp,GlobalReactivePower,type = 'l',xlab = 'datetime',ylab = 'Global_reactive_power',main = '')

dev.copy(png,file='plot4.png',height=480,width=480)
dev.off()
