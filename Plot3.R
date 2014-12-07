file <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
file1 <- file[file$Date=="1/2/2007",]
file2 <- file[file$Date=="2/2/2007",]
powdata <- rbind(file1,file2)
powdata$DateTime <- strptime(paste(powdata$Date,powdata$Time),format="%d/%m/%Y %H:%M:%S")
powdata$Date <- as.Date(powdata$Date,format="%d/%m/%Y")
with(powdata,plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",col="black",type="l"))
lines(powdata$DateTime,powdata$Sub_metering_2,col="red",typ="l")
lines(powdata$DateTime,powdata$Sub_metering_3,col="blue",typ="l")
legend("topright",lty=1,cex=0.7,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="Plot3.png")
dev.off()
