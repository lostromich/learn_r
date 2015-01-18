# =========================================
# Getting and Clearning Data 
# -------------------------
# Week2 Question 4:
# ------------------------
# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
# http://biostat.jhsph.edu/~jleek/contact.html
# ========================================
library("XML")

fileUrl<-"http://biostat.jhsph.edu/~jleek/contact.html"

# Get html file 
doc = readLines(fileUrl)

nchar(doc[10])
nchar(doc[20])
nchar(doc[30])
nchar(doc[100])
# Answer : 45,31, 7, 25
#
