## Flávia ###
## 2020-05-10 21:07:49 -03 ##
## Exploring Data Analysis ##
## Course Project 1 ##

### Plot 4 ###

# clean environment
rm(list = ls())

# Read the file downloaded for plot 1 into R
household <- read.table("household_power_consumption.txt", sep = ";",
                        header = T, stringsAsFactors = F, na.strings = "?")

# Convert date and time to proper classes in R

# Put together date and time
household$Date_and_Time <- paste(household$Date, household$Time)

# Convert it
household$Date_and_Time <- strptime(household$Date_and_Time , 
                                    format = "%d/%m/%Y %H:%M:%S")

# Get subset of the data that will be used to make this plot
# The subset needed are the days 2007-02-01 and 2007-02-02
household_used <- subset(household, format(Date_and_Time,'%d-%m-%Y') 
                         %in% c('01-02-2007', '02-02-2007'))

# Make the plot
png("plot4.png", width = 480)
par(mfrow = c(2,2))
with(household_used, plot(Date_and_Time, Global_active_power, type = "n",
                          xlab = "",
                          ylab = "Global Active Power (kilowatts)"),
     cex = 0.6)
with(household_used, lines(Date_and_Time, Global_active_power))

with(household_used, plot(Date_and_Time, Voltage, type = "n",
                          xlab = "datetime",
                          ylab = "Voltage"))
with(household_used, lines(Date_and_Time, Voltage))

with(household_used, plot(Date_and_Time, Sub_metering_1, 
                          type = "n", xlab = "", ylab = "Energy sub metering"))
with(household_used, lines(Date_and_Time, Sub_metering_1, col = "black"))
with(household_used, lines(Date_and_Time, Sub_metering_2, col = "red"))
with(household_used, lines(Date_and_Time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.8, bty = "n")

with(household_used, plot(Date_and_Time, Global_reactive_power, type = "n",
                          xlab = "datetime"))
with(household_used, lines(Date_and_Time, Global_reactive_power))
dev.off()
