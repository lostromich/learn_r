# =========================================
# Reg Expr 1
# =========================================
# libraries

# Simple Date
d1=date()
d1
class(d1)

# System Date
d2=Sys.Date()
d2
class(d2)
format(d2, "%A %B %d")
format(d2, "%a %b %d %Y")

# Vector of dates - conversion
x=c("1jan1960", "2jan1960", "30jun1960", "31jul1960");
z=as.Date(x,"%d%b%Y")
z

# Difference
z[1]-z[2]

as.numeric(z[1]-z[2])

#
weekdays(d2)
months(d2)
julian(d2)
# =========================================
# More dates
# =========================================
# libraries
library(lubridate)

my_date="19570928"
ymd(my_date)

mdy("08/04/2013")

ymd_hms("2014-12-26 10:31:12")

ymd_hms("2014-12-26 10:31:12" , tz="Pacific/Auckland")

Sys.timezone()

x=dmy(c("1jan1960", "2jan1960", "30jun1960", "31jul1960"));
wday(x[1])

wday(x[1], label=TRUE)
