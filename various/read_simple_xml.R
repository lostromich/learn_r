# ====================================
# Read simple XML file
# ====================================
# libraries
library("XML")

fileUrl<-"http://www.w3schools.com/xml/simple.xml"

# Get simple xml file 
doc<-xmlTreeParse(fileUrl,useInternalNodes = TRUE)

# Check the output list
root_node=xmlRoot(doc)

# Print root node name
xmlName(root_node)

# Print all names
names(root_node)

# First element
root_node[[1]]

# First element of the first element
root_node[[1]][[1]]

# All values
xmlSApply(root_node,xmlValue)

# Extract names
xpathSApply(root_node, "//name", xmlValue)

# Extract prices
xpathSApply(root_node, "//price", xmlValue)

# Extract calories
xpathSApply(root_node,"//calories", xmlValue)

dateDownloaded<-date()
dateDownloaded


