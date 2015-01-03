# ====================================
# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006
# microdata survey about housing for the state of Idaho using download.file() from here: 
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object
# DT
# 
# Which of the following is the fastest way to calculate the average value of the variable
# 
# pwgtp15 
# 
# broken down by sex using the data.table package?
# 
# ====================================
# Libraries
library(data.table)
# Check and create output folder
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "survey.csv"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, destfile=dest_file_long, method="auto")
dest_file_long

# Read the file
DT=fread(dest_file_long)
# Compare speed of calculation

# list of start times and end times

test=0
diff= 999999
d1=Sys.time()
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15);
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=1
  diff=diff1
}                                   

d1=Sys.time()
tapply(DT$pwgtp15,DT$SEX,mean)
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=2
  diff=diff1
}             

# This is the fstest method:
d1=Sys.time()
mean(DT$pwgtp15,by=DT$SEX)
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=3
  diff=diff1
}             

d1=Sys.time()
DT[,mean(pwgtp15),by=SEX]
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=4
  diff=diff1
}             

d1=Sys.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=5
  diff=diff1
}             

d1=Sys.time()
rowMeans(DT)[DT$SEX==1]; 
rowMeans(DT)[DT$SEX==2];
diff1=Sys.time() - d1                                   
if (diff1 < diff) {
  test=6
  diff=diff1
}             

# ----------------------------------------
# Result - test N
test
# Diff time
diff
# ----------------------------------------


