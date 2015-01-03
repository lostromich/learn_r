# ====================================
# Read Baltimor camera data csv
# ====================================
targetDir<-"BaltimorCameraData"
outFile="cameras.csv"

# Paths
outRelativePath=paste("./", targetDir, sep="")
outRelativeFile=paste(outRelativePath, "/",outFile, sep="" )

# Check the output list
cameraData<-read.table(outRelativeFile, quote="\"", sep=",", header=TRUE)
head(cameraData)

# Date 
dateDownloaded<-date()
dateDownloaded
