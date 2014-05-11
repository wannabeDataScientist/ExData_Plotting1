#PLEASE RUN THIS CODE IN R CONSOLE and not in R-STUDIO.THANKS
# plot3.R - Assignment 1
# Provides the code for reading the Household power consumption data
# and create four plots for energy sub metering(1,2,3) for two days in Feb 2007

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
png("plot3.png", height=480, width=480)





# Prepare the blank Plot for Submetering vs Date
plot(df$Timestamp,
     df$Sub_metering_1,
     pch=NA,
     xlab="",
     ylab="Energy sub metering")
	legend("topright",  c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
				col=c("black","red","blue"),lwd=1,lty=c(1,1,1),
				pch=c(NA,NA,NA))



#Add the graph lines
lines(df$Timestamp, df$Sub_metering_1, col="black")
lines(df$Timestamp, df$Sub_metering_2, col="red")
lines(df$Timestamp, df$Sub_metering_3, col="blue")



# Close PNG file
dev.off()

