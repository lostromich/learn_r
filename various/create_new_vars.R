# =========================================
# Summarizing data
# =========================================
# libraries
#
setInternet2(TRUE)
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "restaurants.csv"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile=dest_file_long, method="auto")
dest_file_long

# read data and how it
rest_data<-read.csv(dest_file_long)
head(rest_data)

# =========================================
# Create Sequences
# =========================================
s1<-seq(1,10, by=3)
s1

s2<-seq(1,10,length=4)
s2

x<-c(1,3,5,7,97,100)
s3<-seq(along.with = x)
s3

rest_data$nearMe=rest_data$neighborhood %in% c("Roland Park", "Homeland")
table(rest_data$nearMe)

# true and false
rest_data$zipWrong=ifelse(rest_data$zipCode<0,TRUE,FALSE)
table(rest_data$zipWrong, rest_data$zipCode<0)
# =========================================
# Create Categorical variables
# =========================================
rest_data$zipGroups=cut(rest_data$zipCode, breaks=quantile(rest_data$zipCode))
table(rest_data$zipGroups)

table(rest_data$zipGroups, rest_data$zipCode)

# =========================================
# Easier grouping
# =========================================
library(Hmisc)
rest_data$zipGroups1=cut2(rest_data$zipCode, g=4)
table(rest_data$zipGroups1)

# =========================================
# Convert to factor variable
# =========================================
rest_data$zcf=factor(rest_data$zipCode)
rest_data$zcf[1:10]

class(rest_data$zcf)

# Levels of factors
yesno<-sample(c("yes","no"), size=10, replace=TRUE)
yesnofac=factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")

as.numeric(yesnofac)

# =========================================
# Using plyr package to mutate
# =========================================
library(Hmic)
library(plyr)
rest_data2=mutate(rest_data, zipGroups=cut2(zipCode, g=4))
table(rest_data2$zipGroups)

