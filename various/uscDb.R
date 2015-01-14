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

                   