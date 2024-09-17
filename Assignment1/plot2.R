temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), 
                    sep=";", 
                    header = T, 
                    na="?", 
                    colClasses = c("character",
                                   'character',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric'))

sub_data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)

with(sub_data, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.off()