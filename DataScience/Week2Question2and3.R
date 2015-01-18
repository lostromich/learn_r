# =========================================
# Getting and Clearning Data 
# -------------------------
# Week2 Question 2:
# ------------------------
# The sqldf package allows for execution of SQL commands on R data frames. 
# We will use the sqldf package to practice the queries we might send with 
# the dbSendQuery command in RMySQL. 
# Download the American Community Survey data and load it into an R object called acs
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
#
# Which of the following commands will select only the data for the probability
# weights pwgtp1 with ages less than 50? 
# 
# sqldf("select * from acs where AGEP < 50") 
# sqldf("select * from acs")
# sqldf("select pwgtp1 from acs where AGEP < 50")
# sqldf("select pwgtp1 from acs")
# ----------------------
# Question 3:
# ----------------------
# Using the same data frame you created in the previous problem, 
# what is the equivalent function to unique(acs$AGEP)
# sqldf("select DISTINCT AGEP from acs")
# =========================================
# Libraries
library("sqldf")

# Check and create output folder
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "american_community_survey.csv"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, destfile=dest_file_long, mode="wb")
dest_file_long

# read data and show few lines
acs<-read.csv(dest_file_long, header=TRUE)
head(acs)
names(acs)

# Answer the question N 2
sqldf("select pwgtp1 from acs where AGEP < 50", drv="SQLite")

# Answer to the question N 3
sqldf("SELECT DISTINCT AGEP FROM acs", drv="SQLite")

