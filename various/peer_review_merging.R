# =========================================
# Peer review data - Merging
# =========================================
# libraries

#
setInternet2(TRUE)
#
data_folder_short<-"data"
data_folder_long = paste("./", data_folder_short, sep="")

# Destination file 1
dest_file_short1= "reviews.csv"
dest_file_long1 = paste(data_folder_long, "/", dest_file_short1, sep="")

# Destionation file 2
dest_file_short2= "solutions.csv"
dest_file_long2 = paste(data_folder_long, "/", dest_file_short2, sep="")

if (!exists(data_folder_short)) {
  dir.create(data_folder_long)
}
data_folder_long

# url & download
url1<-"https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
url2<-"https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(url1, destfile=dest_file_long1, method="auto")
download.file(url2, destfile=dest_file_long2, method="auto")
dest_file_long1
dest_file_long2

# read the files
reviews=read.csv(dest_file_long1)
solutions=read.csv(dest_file_long2)

head(reviews)
head(solutions)
names(reviews)
names(solutions)

# Merge data
merged_data=merge(reviews,solutions, by.x="solution_id", by.y="id", all=TRUE)
head(merged_data)

# Intersect names
intersect(names(reviews),names(solutions))

merged_data2=merge(reviews,solutions,all=TRUE)
head(merged_data2)

# Using join from plyr
df1=data.frame(id=sample(1:10), x=rnorm(10) )
df2=data.frame(id=sample(1:10), y=rnorm(10) )
df3=data.frame(id=sample(1:10), z=rnorm(10) )
arrange(join(df1,df2), id)

df_list=list(df1,df2,df3)
join_all(df_list)
