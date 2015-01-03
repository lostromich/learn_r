# =========================================
# Edit text
# =========================================
# libraries
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
download.file(fileUrl, destfile=outRelativeFile,method="auto" )

# Check the output list
list.files(outRelativePath)

# Date Downloaded
dateDownloaded<-date()
dateDownloaded

outRelativeFile

camera_data<-read.csv(outRelativeFile)
tolower(names(camera_data))

split_names=strsplit(names(camera_data),"\\.")
split_names
split_names[[9]]

# Lists
my_list=list(letters=c("A", "b", "c"), numbers=1:3, matrix(1:25, ncol=5))
my_list
my_list$letters
my_list$numbers

my_list[[1]]

# Take first eleemnt of the columnt name
split_names[[9]][1]

fun_first_element<-function(x)  {
  x[1]
}
sapply(split_names,fun_first_element)

# Find out specific intersections

find_inter=grep("Alameda", camera_data$intersection)
find_inter
camera_data[find_inter,]


# True /false for Alameda
find_inter_logical=table(grepl("Alameda", camera_data$intersection))
find_inter_logical

# no Alameda
camera_data_no_alameda=camera_data[!grepl("Alameda", camera_data$intersection),]
camera_data_no_alameda

# Return value not row number
grep("Alameda", camera_data$intersection, value=TRUE)

# If note found it returens zero
grep("Lev", camera_data$intersection)
# length =0 
length(grep("Lev", camera_data$intersection))

# Library stringr
library(stringr)
nchar("Lev Ostromich")
substr("Lev Ostromich", 1,7)

paste("Lev", " ", "Ostromich")

paste0("Lev","Ostromich")

str_trimrim(" Lev    ")
# ========================================
# Work with reviews and soutions
# ========================================
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

# Destination file 1
dest_file_short1= "reviews.csv"
dest_file_long1 = paste(data_folder_long, "/", dest_file_short1, sep="")

# Destionation file 2
dest_file_short2= "solutions.csv"
dest_file_long2 = paste(data_folder_long, "/", dest_file_short2, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
# url1<-"https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
# url2<-"https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
# download.file(url1, destfile=dest_file_long1, method="auto")
# download.file(url2, destfile=dest_file_long2, method="auto")
dest_file_long1
dest_file_long2

# read the files
reviews=read.csv(dest_file_long1)
solutions=read.csv(dest_file_long2)

head(reviews)
head(solutions)
names(reviews)
names(solutions)

# Substitute
sub("_","",names(solutions),)

# Substitute and global sub
test_name<-"this_is_a_test"
sub("_","",test_name)
gsub("_", "", test_name)

