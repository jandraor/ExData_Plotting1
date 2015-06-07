##Loading data
header<-read.table("household_power_consumption.txt", sep = ";",nrows=1, header=TRUE)
data<-read.table("household_power_consumption.txt", sep = ";",skip=66637,nrow=2880,colClasses="character")
colnames(data)<-colnames(header)
##Creating Graph 2
GlobalActivePower<-as.numeric(data[[3]])
CleanData<-GlobalActivePower[!is.na(GlobalActivePower)]
date<- data[[1]]
time<- data[[2]]
datetime<-paste(date,time)
datetime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
plot(datetime,CleanData,main="",xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(datetime,CleanData)
dev.off()
