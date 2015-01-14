# Work wiht MySQL

# Load RMySQL Library
library(RMySQL)

# Connect 
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
# Get the list of databases
result<-dbGetQuery(ucscDb, "show databases;")

# Show the result
result 

# Clean up and disconnect
dbDisconnect(ucscDb)

# =====================================
# Connect to hg19
# =====================================
con_hg19 <-dbConnect(MySQL(), user="genome", db="hg19",  host="genome-mysql.cse.ucsc.edu")

# Get the list of databases
allTables<-dbListTables(con_hg19) 

# Show the result
length(allTables)
allTables[1:20]

# List fields of the table we know:
dbListFields(con_hg19, "affyU133Plus2")

# Number records in the table
dbGetQuery(con_hg19, "SELECT COUNT(*) FROM affyU133Plus2")

# Read the table
affyData<-dbReadTable(con_hg19, "affyU133Plus2")
head(affyData)

# Select Part of the data and quantile
query<-dbSendQuery(con_hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches BETWEEN 1 AND 5")
affyMis<-fetch(query)
quantile(affyMis$misMatches)

affyMisSmall<-fetch(query, n= 10)
dbClearResult(query)
dim(affyMisSmall)
# Clean up and disconnect
dbDisconnect(con_hg19)


                   