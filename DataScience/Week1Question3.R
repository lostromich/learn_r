# =========================================
# Getting and Clearning Data 
#
# Week1 Question 3:

# Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
#  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
#  
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#  dat  
#  What is the value of:
#    sum(dat$Zip*dat$Ext,na.rm=T)
# =========================================
# Libraries
library("xlsx")

# Check and create output folder
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "natural_gas_stats.xlsx"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url, destfile=dest_file_long, mode="wb")
dest_file_long

# read data and show few lines
dat<-read.xlsx2(dest_file_long, sheetIndex = 1, header=TRUE, startRow = 18, endRow = 23, colIndex = c(7:15))
head(dat)
names(dat)

# Answer the question
sum(dat$Zip * dat$Ext, na.rm=T) 


