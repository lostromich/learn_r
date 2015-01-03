# =========================================
# Getting and Clearning Data 
#
# Week1 Question 1:

# The American Community Survey distributes downloadable data about United States communities. 
# Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
# and load the data into R. The code book, describing the variable names is here: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
# How many properties are worth $1,000,000 or more?
# 53
# 31
# 47
# 24
# =========================================
# Check and create output folder
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "housing_stats.csv"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile=dest_file_long, method="auto")
dest_file_long

# read data and show few lines
houses<-read.csv(dest_file_long)
head(houses,n=5)
names(houses)

# Create list of properties with price greater than defined price
cutoff_price=1000000
# Set up True /false (TRUE for houses with price greater than 1000000)
selected_houses=houses$VAL >=24

# Question 1 Answer:

# Count TRUE values
length(which(selected_houses))

# Another way to count TRUE values
sum(selected_houses[selected_houses==TRUE], na.rm = TRUE)

# Question 2
# Use the data you loaded from Question 1. 
# Consider the variable FES in the code book. 
# Which of the "tidy data" principles does this variable violate?
houses$FES

