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
hist(data2$Global_active_power,
     breaks=12,
     col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
