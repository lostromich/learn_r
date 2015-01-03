# ====================================
# Download and read json
# ====================================
# libraries
library(jsonlite)
library(RCurl)

# Target directory and output file
targetDir<-"test"
outFile="repos_new.txt"

# Paths
outRelativePath=paste("./", targetDir, sep="")
outRelativeFile=paste(outRelativePath, "/",outFile, sep="" )


fileUrl<-"https://api.github.com/users/jtleek/repos"
# Get json data 
setInternet2(use=TRUE)
download.file(url=fileUrl, destfile = outRelativeFile)

# Names
#names(json_data);
#names(json_data$owner);

#json_data$owner$login;

dateDownloaded<-date()
dateDownloaded
