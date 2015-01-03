# ====================================
# Read scores html
# ====================================
# libraries
library("XML")

fileUrl<-"http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"

# Get html file 
doc<-htmlTreeParse(fileUrl,useInternal = TRUE)

# Get team names
teams = xpathSApply(doc, "//li[@class='team-name']", xmlValue)
# Get team scores
scores = xpathSApply(doc, "//li[@class='score']", xmlValue)

# Print results
teams
scores

dateDownloaded<-date()
dateDownloaded

