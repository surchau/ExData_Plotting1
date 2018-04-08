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
## plot2

with(mydata, plot(Global_active_power~DateTime ,type = "l",xlab="",
                  ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()