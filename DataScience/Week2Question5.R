# =========================================
# Getting and Clearning Data 
# -------------------------
# Week2 Question 5:
# ------------------------
# Read this data set into R and report the sum of the numbers in the fourth of the nine columns. 
# https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
#  Original: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for 
# ========================================
library("XML")

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

# Get html file 
doc = readLines(fileUrl)

head(doc)
# Get part we need to calculate summary
s1=substr(doc, 26,32)

# Select only from row Number 5 where all number starts
s2=s1[5:length(s1)]

# summary
sum(as.numeric(s2))

# Answer:
# 32426.7

#
