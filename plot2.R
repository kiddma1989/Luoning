#read file

temp<-read.table('household_power_consumption.txt',header = TRUE,sep = ';')

#subset data

data<-temp[temp$Date%in%c('1/2/2007','2/2/2007'),]
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$temp<-strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

GlobalActivePower<-as.numeric(paste(data$Global_active_power))

#Plot2
plot(data$temp,GlobalActivePower,type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)',
     main = '')
dev.copy(png,file='plot2.png',height=480,width=480)
dev.off()

