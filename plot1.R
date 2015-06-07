##Loading data
header<-read.table("household_power_consumption.txt", sep = ";",nrows=1, header=TRUE)
data<-read.table("household_power_consumption.txt", sep = ";",skip=66637,nrow=2880,colClasses="character")
colnames(data)<-colnames(header)
##Creating Graph 1
GlobalActivePower<-as.numeric(data[[3]])
CleanData<-GlobalActivePower[!is.na(GlobalActivePower)]
png(file="plot1.png")
hist(CleanData,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
