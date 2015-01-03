ucscDb <- dbConnect(dbDriver("MySQL"), user="genome",  host="gemone-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)
result
                   