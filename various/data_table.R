# =========================================
# Data table
# =========================================
# libraries
library(data.table)
DT=data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DT,10)

# See tables in Memory
tables()
# Subset rows
DT[2,]
# Subset element
DT[DT$y=="a",]
# Subset rows
DT[c(2,3)]
# Apply functions to columns
DT[,list(mean(x),mean(z))]

DT[,table(y)]
DT[,w:=z^2]

DT[,w:={tmp<-x+z; log(tmp+5)}]

DT[,a:=x>0]

DT[,b:=mean(x+w), by=a]

#
# .N
set.seed(123)
DT1=data.table(x=sample(letters[1:3], 1E5, TRUE))
DT1[,.N, by=x]

# Table and set keys
DT2<-data.table(x=rep(c("a","b","c"), each=100), y=rnorm(300))
setkey(DT2, x)
DT2['a']