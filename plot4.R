##Loading data
header<-read.table("household_power_consumption.txt", sep = ";",nrows=1, header=TRUE)
data<-read.table("household_power_consumption.txt", sep = ";",skip=66637,nrow=2880,colClasses="character")
colnames(data)<-colnames(header)

##Creating Graph 4

##Extracting data
date<- data[[1]]
time<- data[[2]]
datetime<-paste(date,time)
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
GlobalActivePower<-as.numeric(data[[3]])
voltage<- as.numeric(data[[5]])
CleanData<-GlobalActivePower[!is.na(GlobalActivePower)]
SubMetering1<-as.numeric(data[[7]])
SubMetering2<-as.numeric(data[[8]])
SubMetering3<-as.numeric(data[[9]])
GlobalReactivePower<- as.numeric(data[[4]])

png(file="plot4.png")
#top-left graph
par(mfrow=c(2,2))
plot(datetime,CleanData,main="",xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(datetime,CleanData)

#top-right graph
plot(datetime,voltage,main="",xlab="datetime",ylab="Voltage", type="n")
lines(datetime,voltage)

#bottom-left graph
plot(datetime,SubMetering1,main="",xlab="",ylab="Energy sub metering", type="n")
lines(datetime,SubMetering1)
lines(datetime,SubMetering2, col="red")
lines(datetime,SubMetering3, col="blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))

#bottom-right graph
plot(datetime,GlobalReactivePower,main="",xlab="datetime",ylab="Global_reactive_power", type="n")
lines(datetime,GlobalReactivePower)
dev.off()