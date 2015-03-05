# EDA-CP-1
Exploratory Data Analysis, Course Project 1

### Introduction

This assignment uses data from the UC Irvine Machine Learning Repository “Individual household electric power consumption Data Set”:

### Description

Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following are the 9 variables in the dataset taken from the UCI web site:

**Date**: Date in format dd/mm/yyyy

**Time**: time in format hh:mm:ss

**Global_active_power**: household global minute-averaged active power (in kilowatt)

**Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)

**Voltage**: minute-averaged voltage (in volt)

**Global_intensity**: household global minute-averaged current intensity (in ampere)

**Sub_metering_1**: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

**Sub_metering_2**: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

**Sub_metering_3**: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
Loading the data

### Considerations

When loading the dataset into R, we considered the following:

The dataset has 2,075,259 rows and 9 columns. Since we will use data from the dates 2007-02-01 and 2007-02-02, our alternative was to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates. 

We found useful to convert the Date and Time variables to Date/Time classes in R, as well as converting all other variables to numeric.

Note that in the original dataset missing values are coded as ?.

### Making Plots

Our overall goal here was simply to examine how household energy usage varies over a 2-day period in February, 2007. Our task was to reconstruct the example plots provided in the project.

For each plot  constructed we saved it to a PNG file with a width of 480 pixels and a height of 480 pixels. The plot files were named plot1.png, plot2.png, etc. Also, we created a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Each program  includes code for reading the data so that the plot can be fully reproduced as well as create the PNG files
