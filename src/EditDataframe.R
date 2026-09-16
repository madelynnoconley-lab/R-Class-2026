#Read in the data file “tempExperiment-raw.csv” ” and take a look at it, using the code that we’ve used in previous weeks.
df.t1 <- read.csv("~/Bio781_IntrotoR/R-Class-2026/data/tempExperiment-raw.csv")
View(df.t1)

#editing one value in the original dataframe
my_data[2, 2] <- 32

a <- strsplit(as.character(df.t1$temp), split = '-')
  # note that without "as.character" it thinks the variable is a factor and won't work
newvar <- matrix(unlist(a), ncol = 2, byrow = TRUE) 
head(newvar)

df.t2 <- df.t1 # we set the dataframe to a new variable so we can fix it 
df.t2$temp <- newvar[,1]
df.t2$pop <- newvar[,2]
head(df.t2)

#Use the function sub to give ‘temp’ only numeric values and ‘pop’ only levels ‘pop1’ and ‘pop2.’
df.t2$temp <- sub('ten', '10', df.t2$temp) 
df.t2$temp <- sub('twenty', '20', df.t2$temp) 
df.t2$pop <- sub('population ', 'pop', df.t2$pop) 
str(df.t2)

#set as factor
df.t2$temp <- factor(df.t2$temp) 
df.t2$pop <- factor(df.t2$pop) #why not use as.numeric?
str(df.t2)

#save as csv
write.csv(df.t2, 'data/tempExperiment_v2.csv')