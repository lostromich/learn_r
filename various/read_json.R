# ====================================
# Read json
# ====================================
# libraries
library(jsonlite)
library(RCurl)
# library(foreign)

# fileUrl<-getURL("https://api.github.com/users/jtleek/repos")
fileUrl<-"c:/temp/repo.txt"
# Get json data 
json_data <-fromJSON(fileUrl)

# Names
names(json_data);
names(json_data$owner);

json_data$owner$login;

dateDownloaded<-date()
dateDownloaded
