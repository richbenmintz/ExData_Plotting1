createPlot2 <- function()
{
      require(data.table)
      plotData<-fread("exdata_data_household_power_consumption\\household_power_consumption.txt",
                       colClasses=c("Date", "time", "character","character","character","character","character","character","character" ))
      #str(plot1Data)
      plotData$Global_active_power[plotData$Global_active_power == "?"] <- NA
      plotData$Date <- as.Date(plotData$Date, "%d/%m/%Y")
     
      plotData <- plotData[plotData$Date >="2007-02-01" & plotData$Date <= "2007-02-02"]
      png("plot2.png", width=480, height=480)
     g_range <- range(0, plotData$Global_active_power)
    
     
     
      plot(as.numeric(plotData$Global_active_power) , type="l", axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)")
     axis(1, at=1, lab=c("Thu"),  xlab="NULL")
     axis(1, at=nrow(plotData)/2, lab=c("Fri"),xlab="NULL")
     axis(1, at=nrow(plotData), lab=c("Sat"),xlab="NULL")
     axis(2, las=1, at=2*0:g_range[2])
     box()
      dev.off()
}