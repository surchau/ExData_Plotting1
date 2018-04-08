## assuming working directory has  "household_power_consumption.txt"
data_all <- read.csv("household_power_consumption.txt", header=T, sep=";", 
                     na.strings = "?", nrows = 2075259, check.names = F,
                     stringsAsFactors = F, comment.char = "", quote = '\"')
mydata<- subset(data_all, Date %in% c("1/2/2007" , "2/2/2007"))


## check sample data
str(mydata)  ##Date ais character type

## convert Date column from character to Date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

datetime <- paste(as.Date(mydata$Date), mydata$Time)
mydata$DateTime <- as.POSIXct(datetime)
## now DateTime has been added to the dataset.plot graph with type='l' for lines
## plot4 mfrow to set 2 rows and 2 columns 
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
with(mydata, {
  plot(Global_active_power~DateTime ,type = "l",xlab="",
                  ylab="Global Active Power")
  plot(Voltage~DateTime, type="l", xlab="datetime", ylab="Voltage")
  plot(Sub_metering_1~DateTime ,type = "l",xlab="",
       ylab="Energy sub metering")
  lines(Sub_metering_2~DateTime, col="Red")
  lines(Sub_metering_3~DateTime,  col="Blue")
  legend("topright",col=c("black","red","blue"),lty=1,lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")
  })