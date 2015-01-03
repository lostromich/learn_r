# =========================================
# Subsetting Review
# =========================================
# libraries
set.seed(12354)

X<-data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
X$var2[c(1,3)]=NA

X

# Column 1
X[,1]
X[,"var1"]

X[1:2,"var2"]

# Logical Operations
X[X$var1<=3 & X$var3>=11, ]

X[X$var1<=3 | X$var3>=15, ]

# Dealing with missing values
X[which(X$var2>=8), ]

# =========================================
# Sort
# =========================================
sort(X$var1)

sort(X$var2, decreasing = TRUE)

sort(X$var2, decreasing = TRUE, na.last = TRUE)

# =========================================
# Ordering of Data Frame
# =========================================
X[order(X$var1, decreasing = TRUE, X$var3), ]

# =========================================
# Ordering with plyr 
# =========================================
library(plyr)
arrange(X,var1)

arrange(X,desc(var1))

# =========================================
# Adding rows and columns
# =========================================
X$var4<-rnorm(5)
X

# Binding on the right side
Y<-cbind(X,rnorm(5))
Y

# Binding on the left side 
Z<-cbind(sample(95:99), Y)
Z

# Binding on the Bottom of Data Frame 
A<-rbind(Z, sample(101:106))
A

# Binding on the Top of Data Frame 
B<-rbind(sample(101:106), Z)
B
