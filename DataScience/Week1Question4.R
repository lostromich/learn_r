# ====================================
# 
# Read the XML data on Baltimore restaurants from here: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
# How many restaurants have zipcode 21231?
# ====================================
# Libraries
library(httr)

url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
html_2=GET(url)
content_2=content(html_2,as="text")
parsed_html=htmlParse(content_2, asText=TRUE)

# Check what is in parsed_html
parsed_html
# All zipcodes
zipcodes=xpathApply(parsed_html, "//zipcode", xmlValue)

# Count number addresses with zip code 21231
sum(zipcodes==21231)


