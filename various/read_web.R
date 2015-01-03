# =========================================
# Read Web
# =========================================
# libraries
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ")
html_lines=readLines(con)  
close(con)

# Display Result
html_lines

# =========================================
# Read Web and parse using XML
# =========================================
# libraries
library(XML)
url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html<-htmlTreeParse(url,useInternalNodes = T)

xpathSApply(html,"//title",xmlValue)

xpathSApply(html,"//td[@id='col-citedby']", xmlValue)

# =========================================
# Read Web using httr
# =========================================
# libraries
library(httr);
html_2=GET(url)
content_2=content(html_2,as="text")
parsed_html=htmlParse(content_2, asText=TRUE)
parsed_html
xpathApply(parsed_html, "//title", xmlValue)

# =========================================
# Accessing websites with passwords
# =========================================
# libraries
library(httr);

url1="http://httpbin.org/basic-auth/user/passwd"
pg1=GET(url1, authenticate("user","passwd"))
pg1
names(pg1)

# =========================================
# Using Handler cookie stays with authantification
# =========================================
# libraries
library(httr);

google=handler("http://google.com");

pg1=GET(handle=google,path="/")
pg2=GET(handle=google,path="search")
