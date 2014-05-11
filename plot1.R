
# plot1.R - Assignment 1
# Provides the code for reading the Household power consumption data
# and makes a histogram of global active power for two days in Feb 2007

# Read data, convert dates 

df <- read.csv("household_power_consumption.csv", as.is=T,header=T, 
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
                          "%d/%m/%Y %H:%M:%S")

# Open PNG file of given dimensions
png("plot1.png", height=480, width=480)


# Histogram
hist(df$Global_active_power, col='red',
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
# Close PNG file
dev.off()

