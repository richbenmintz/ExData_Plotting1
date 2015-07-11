createPlot1 <- function()
{
      require(data.table)
      plot1Data<-fread("exdata_data_household_power_consumption\\household_power_consumption.txt",
                       colClasses=c("Date", "time", "character","character","character","character","character","character","character" ))
      #str(plot1Data)
      plot1Data$Global_active_power[plot1Data$Global_active_power == "?"] <- NA
      plot1Data$Date <- as.Date(plot1Data$Date, "%d/%m/%Y")
     
      plot1Data <- plot1Data[plot1Data$Date >="2007-02-01" & plot1Data$Date <= "2007-02-02"]
      png("plot1.png", width=480, height=480)
      hist(as.numeric(plot1Data$Global_active_power), main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red" )
      dev.off()
}