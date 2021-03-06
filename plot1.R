# The data file will be processed line by line to be able to extract
# only those observations we require. So, we first establish
# a connection with the file for reading.
# The file is assumed to be in the same folder as this program.
inputFile <- "household_power_consumption.txt"
con  <- file(inputFile, open = "r")

# We know that the data file has a header with the names of the variables.
# Therefore, we read the first line, extract these names, and build an empty
# data table containing only the variables.
# This data table will be filled in row-by-row with just the information
# satisfying the selection criteria.

# first line of file is the header with variable names
oneLine <- readLines(con, n=1, warn=FALSE) 

# divide the string to extract each name. Names are separated by ';'
myVector <- strsplit(oneLine, ";")  

# build a matrix with one column per name, and one row to store these names
names <- matrix(unlist(myVector),ncol=9,nrow=1) 

# convert the matrix into an empty data frame where we'll store the subsetted data
data <- setNames(data.frame(matrix(ncol = 9, nrow = 0)),names)

# we'll process the data file one line at a time.
# we know we've reached the end of the file when the line read is length zero
while (length(oneLine <- readLines(con, n=1, warn=FALSE)) > 0) {
    # separate the line into one string for each value
    myVector <- strsplit(oneLine, ";")

    # convert the vector of string values into a matrix
    row <- matrix(unlist(myVector),ncol=9,nrow=1)
    
    # dates are stored in the first location of the row:
    # we select only those rows satisfying the correct date
    if (row[1,1]=="1/2/2007" | row[1,1]=="2/2/2007") {
        # convert the row into a data frame with variables and values
        df <- setNames(as.data.frame(row),names)
    
        # append the row to the end of the working data table
        data <- rbind(data,df)
    }
} 
# close the file connection: the data table is complete
close(con)

# Since the built data table is made of strings, we have to convert the column 
# we need to the correct numeric type to be able to work with its values.
# Note that columns were created as 'factors'.
data$Global_active_power <- 
    as.numeric(levels(data$Global_active_power))[data$Global_active_power]

# build the graph
hist(data$Global_active_power,
     breaks=12,
     col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# save the graph in a PNG file, and terminate
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
