# plot4.R - Assignment 1
# Provides the code for reading the Household power consumption data
# and create plot for Global Active power for two days in Feb 2007

# Read data, convert dates 

df <- read.table("household_power_consumption.txt", as.is=T,header=T, 
	sep=";",colClasses = c('character', 'character', 'numeric',
                                  'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric')
	,na.strings='?')
#convert the Date field(chr) to Date
df$Date1<-as.Date(df$Date, "%d/%m/%Y")
# subset on two days in February 2007
df <- subset(df,
               df$Date1 >= as.Date("2007-02-01") &
                   df$Date1 <= as.Date("2007-02-02"))

df$Timestamp <- strptime(paste(df$Date, df$Time),
                          "%d/%m/%Y %H:%M:%S",tz="GMT")

# Open PNG file of given dimensions
png("plot2.png", height=480, width=480)



# Prepare the blank Plot for Voltage vs Date
plot(df$Timestamp,
     df$Global_active_power,
     pch=NA,
     xlab="",
     ylab="Global Active Power (kilowatts)")
#Add the Global_active_power graph lines
lines(df$Timestamp, df$Global_active_power)



# Close PNG file
dev.off()

