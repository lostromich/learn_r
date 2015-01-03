# ====================================
# Read Baltimor camera data csv
# ====================================
# Libraries
library("xlsx")

# Target directory and output file
targetDir<-"BaltimorCameraData"
outFile="cameras.xlsx"

# Paths
outRelativePath=paste("./", targetDir, sep="")
outRelativeFile=paste(outRelativePath, "/",outFile, sep="" )

# Check the output list
cameraData<-read.xlsx(outRelativeFile, sheetIndex=1, header=TRUE)
head(cameraData)

# Date 
dateDownloaded<-date()
dateDownloaded
