# =========================================
# Connect to genome MYSQL DB
# =========================================
# libraries
library(RMySQL)

# Connect to remote db
ucscDB <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")

res <- dbGetQuery(ucscDB, "show databases");
res;

# Disconnect and clean up
dbDisconnect(ucscDB)

# =========================================
# Connect to genome MYSQL DB, specific DB
# =========================================
hg19<-dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")

# Get table list
hg19_tables<-dbListTables(hg19)

# Lengths
length(hg19_tables)

# Show several tables
hg19_tables[1:20]

# Get Query to Specific Table
fields<-dbListFields(hg19, "affyU133Plus2")
fields;

# Count records
cnt<-dbGetQuery(hg19, "SELECT COUNT(*) FROM affyU133Plus2")
cnt

# Read Table into Data Frame
#affy_data<-dbReadTable(hg19, "affyU133Plus2");
#head (affy_data)

# Select part of the data with specific mismatches
query<-dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches BETwEEN 1 AND 3")
res_affy_mis<-fetch(query);
quantile(res_affy_mis$misMatches)

# first 10 rows
res_affy_mis_small<-fetch(query, n=20)
dim(res_affy_mis_small)

dbClearResult(query);


# Disconnect and Clean-up
dbDisconnect(hg19)