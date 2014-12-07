file <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
file1 <- file[file$Date=="1/2/2007",]
file2 <- file[file$Date=="2/2/2007",]
powdata <- rbind(file1,file2)
powdata$DateTime <- strptime(paste(powdata$Date,powdata$Time),format="%d/%m/%Y %H:%M:%S")
powdata$Date <- as.Date(powdata$Date,format="%d/%m/%Y")
hist(powdata[,3],col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",ylim=c(0,1200))
dev.copy(png,file="Plot1.png")
dev.off()
