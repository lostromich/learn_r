# =========================================
# Average values
# =========================================
# libraries
#
head(InsectSprays)

tapply(InsectSprays$count, InsectSprays$spray, sum)

# Split
split_by_name<-split(InsectSprays$count, InsectSprays$spray)
split_by_name

# Now summarize result
split_by_name_sum=lapply(split_by_name, sum)
split_by_name_sum

unlist(split_by_name_sum)

sapply(split_by_name,sum)
#
library(plyr)
# Summarize
ddply(InsectSprays,.(spray), summarise, sum1=sum(count))

# Creating new variable
spray_sums<-ddply(InsectSprays,.(spray), summarise, sum=ave(count,FUN=sum))
dim(spray_sums)
head(spray_sums)
