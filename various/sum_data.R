# =========================================
# Summarizing data
# =========================================
# libraries

#
setInternet2(TRUE)
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

dest_file_short= "restaurants.csv"
dest_file_long = paste(data_folder_long, "/", dest_file_short, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url<-"https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile=dest_file_long, method="auto")
dest_file_long

# read data and how it
rest_data<-read.csv(dest_file_long)
head(rest_data,n=5)

tail(rest_data, n=3)

# Show some summaries
summary(rest_data)

# Show Meta data
str(rest_data)

# Quantile
quantile(rest_data$councilDistrict, na.rm = TRUE)

quantile(rest_data$councilDistrict, probs = c(0.5, 0.75, 0.95))

# Make a table
zip_table = table(rest_data$zipCode, useNA = "ifany")
zip_table

district_zip_table = table(rest_data$councilDistrict, rest_data$zipCode)
district_zip_table

# Check for missing values
sum(is.na(rest_data$councilDistrict))

any(is.na(rest_data$councilDistrict))

all(rest_data$zipCode > 0)

# Rows and columns sums

colSums(is.na(rest_data))

all (is.na(rest_data) ==0)
# =========================================
# Values with specific characteristics
# =========================================
# libraries

table(rest_data$zipCode %in% c("21212","21213"))

# All restaurants with specific zip code 
rest_data[rest_data$zipCode %in% c("21212", "21213"), ]

# =========================================
# Cross tabs 
# =========================================
# libraries
data(UCBAdmissions)
DF=as.data.frame(UCBAdmissions)
summary(DF)

# Dependancies
xt<-xtabs(Freq ~ Gender + Admit, data=DF)
xt

# =========================================
# Cross tabs flat tables 
# =========================================
# libraries
wb<-warpbreaks
wb$replicate<-rep(1:9, len=54)
xt<-xtabs(breaks ~., data=wb)
xt

ftable(xt)

# Size of data set
fake_data= rnorm(1e4)
object.size(fake_data)

print(object.size(fake_data), units="Mb")
