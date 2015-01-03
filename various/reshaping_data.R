# =========================================
# Reshaping Data
# =========================================
# libraries
#
library(reshape2)
tail(mtcars)

# Melting Data Frames
mtcars$carname<-rownames(mtcars)
head(mtcars)

car_melt<-melt(mtcars, id=c("carname","gear","cyl"), measure.vars = c("mpg", "hp"))
car_melt

# Cyl data
cyl_data<-dcast(car_melt, cyl ~ variable, mean)
cyl_data

gear_data<-dcast(car_melt, gear ~ variable)
gear_data

