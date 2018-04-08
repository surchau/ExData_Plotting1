## assuming working directory has  "household_power_consumption.txt"
data_all <- read.csv("household_power_consumption.txt", header=T, sep=";", 
                     na.strings = "?", nrows = 2075259, check.names = F,
                     stringsAsFactors = F, comment.char = "", quote = '\"')
mydata<- subset(data_all, Date %in% c("1/2/2007" , "2/2/2007"))

## check sample data
str(mydata)  ##Date ais character type

## convert Date column from character to Date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

hist(mydata$Global_active_power, main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab = "Frequency", col="Red")
png("plot1.png", width = 480, height = 480)
dev.off()