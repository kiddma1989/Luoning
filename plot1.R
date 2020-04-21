#read file

temp<-read.table('household_power_consumption.txt',header = TRUE,sep = ';')

#subset data

data<-temp[temp$Date%in%c('1/2/2007','2/2/2007'),]
GlobalActivePower<-as.numeric(paste(data$Global_active_power))

#Plot1
hist(GlobalActivePower,col = 'red',xlab = 'Global Active Power (kilowatts)',ylab = 'Frequency',
     main = 'Global Active Power')
dev.copy(png,file='plot1.png',height=480,width=480)
dev.off()

