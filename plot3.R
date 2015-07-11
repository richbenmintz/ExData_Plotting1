createPlot3 <- function()
{
      require(data.table)
      plotData<-fread("exdata_data_household_power_consumption\\household_power_consumption.txt",
                       colClasses=c("Date", "time", "character","character","character","character","character","character","character" ))
      #str(plot1Data)
      plotData$Global_active_power[plotData$Global_active_power == "?"] <- NA
      plotData$Date <- as.Date(plotData$Date, "%d/%m/%Y")
     
      plotData <- plotData[plotData$Date >="2007-02-01" & plotData$Date <= "2007-02-02"]

      png("plot3.png", width=480, height=480)
     
  
   
   
   g_range <- range(0, plotData$Sub_metering_1)
    
     
     
      plot(as.numeric(plotData$Sub_metering_1) , type="l", axes=FALSE, xlab="", ylab="Energy Sub Metering")
     lines(as.numeric(plotData$Sub_metering_2), type="l",  col="red")
     lines(as.numeric(plotData$Sub_metering_3), type="l",  col="blue")
     axis(1, at=1, lab=c("Thu"),  xlab="NULL")
     axis(1, at=nrow(plotData)/2, lab=c("Fri"),xlab="NULL")
     axis(1, at=nrow(plotData), lab=c("Sat"),xlab="NULL")
     axis(2, las=1, at=10*0:g_range[2])
     box()
     legend("topright", c("Sub Metering 1" ,"Sub Metering 2","Sub Metering 3"), 
            col=c("black","red", "blue"), lty=1);
     dev.off()
}