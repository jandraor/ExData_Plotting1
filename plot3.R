##Loading data
header<-read.table("household_power_consumption.txt", sep = ";",nrows=1, header=TRUE)
data<-read.table("household_power_consumption.txt", sep = ";",skip=66637,nrow=2880,colClasses="character")
colnames(data)<-colnames(header)
##Creating Graph 3
date<- data[[1]]
time<- data[[2]]
datetime<-paste(date,time)
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
SubMetering1<-as.numeric(data[[7]])
SubMetering2<-as.numeric(data[[8]])
SubMetering3<-as.numeric(data[[9]])
png(file="plot3.png")
plot(datetime,SubMetering1,main="",xlab="",ylab="Energy sub metering", type="n")
lines(datetime,SubMetering1)
lines(datetime,SubMetering2, col="red")
lines(datetime,SubMetering3, col="blue")
legend("topright", legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1))
dev.off()
