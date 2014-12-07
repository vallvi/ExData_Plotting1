file <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")
file1 <- file[file$Date=="1/2/2007",]
file2 <- file[file$Date=="2/2/2007",]
powdata <- rbind(file1,file2)
powdata$DateTime <- strptime(paste(powdata$Date,powdata$Time),format="%d/%m/%Y %H:%M:%S")
powdata$Date <- as.Date(powdata$Date,format="%d/%m/%Y")
plot(powdata$DateTime,powdata[,3],ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.copy(png,file="Plot2.png")
dev.off()
