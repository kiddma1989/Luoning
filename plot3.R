#read file

temp<-read.table('household_power_consumption.txt',header = TRUE,sep = ';')

#subset data

data<-temp[temp$Date%in%c('1/2/2007','2/2/2007'),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$temp<-strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

SubMetering1<-as.numeric(paste(data$Sub_metering_1))
SubMetering2<-as.numeric(paste(data$Sub_metering_2))
SubMetering3<-as.numeric(paste(data$Sub_metering_3))

#Plot3
plot(data$temp,SubMetering1,type = 'l',col = 'black',xlab = '',ylab = 'Energy sub metering',main = '')
lines(data$temp,SubMetering2,col = 'red')
lines(data$temp,SubMetering3,col = 'blue')
legend('topright',lty = 1,col = c('black','red','blue'),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_Metering_3'))

dev.copy(png,file='plot3.png',height=480,width=480)
dev.off()
