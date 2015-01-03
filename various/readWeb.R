con <- url("http://www.jhsph.edu", "r")
out <- readLines(con)
head(out, n=12L)
close(con)

con1 <- url("http://en.wikipedia.org/wiki/R_(programming_language)", "r")
out1 <- readLines(con1)
head(out1, n=12L)
close(con1)