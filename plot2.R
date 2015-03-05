inputFile <- "household_power_consumption.txt"
con  <- file(inputFile, open = "r")

oneLine <- readLines(con, n=1, warn=FALSE)
myVector <- strsplit(oneLine, ";")
names <- matrix(unlist(myVector),ncol=9,nrow=1)
data2 <- setNames(data.frame(matrix(ncol = 9, nrow = 0)),names)

while (length(oneLine <- readLines(con, n=1, warn=FALSE)) > 0) {
    myVector <- strsplit(oneLine, ";")
    row <- matrix(unlist(myVector),ncol=9,nrow=1)
    if (row[1,1]=="1/2/2007" | row[1,1]=="2/2/2007") {
        df <- setNames(as.data.frame(row),names)
        data2 <- rbind(data2,df)
    }
} 

close(con)

data2$Global_active_power <- as.numeric(levels(data2$Global_active_power))[data2$Global_active_power]
data2$Date <- as.Date(levels(data2$Date)[data2$Date],"%d/%m/%Y")
data2$Time <- times(levels(data2$Time)[data2$Time])
dt <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")
plot(dt,data2$Global_active_power,type="s",xlab="",ylab="Global Active Power")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
