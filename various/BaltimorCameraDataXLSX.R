# ====================================
# Baltimor camera data excel -xlsx
# ====================================
# Old link:
# fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

fileUrl<-"https://data.baltimorecity.gov/api/views/ydjd-febd/rows.xlsx?accessType=DOWNLOAD"
targetDir<-"BaltimorCameraData"
outFile="cameras.xlsx"

# Create directory
if (!file.exists(targetDir)) {
  dir.create(targetDir)
}

# Download the data
outRelativePath=paste("./", targetDir, sep="")
outRelativeFile=paste(outRelativePath, "/",outFile, sep="" )
download.file(fileUrl, destfile=outRelativeFile, mode="wb")

# Check the output list
list.files(outRelativePath)

# Date Downloaded
dateDownloaded<-date()
dateDownloaded


