# ====================================
# Baltimor camera data csv
# ====================================
# Old link:
# fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

fileUrl<-"https://data.baltimorecity.gov/api/views/ydjd-febd/rows.csv?accessType=DOWNLOAD"
targetDir<-"BaltimorCameraData"
outFile="cameras.csv"

# Create directory
if (!file.exists(targetDir)) {
  dir.create(targetDir)
}

# Download the data
outRelativePath=paste("./", targetDir, sep="")
outRelativeFile=paste(outRelativePath, "/",outFile, sep="" )
download.file(fileUrl, destfile=outRelativeFile )

# Check the output list
list.files(outRelativePath)

# Date Downloaded
dateDownloaded<-date()
dateDownloaded



