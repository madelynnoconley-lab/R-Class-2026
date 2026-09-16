rm(list=ls(all=TRUE))
df.t <- read.csv('data/tempExperiment_v2.csv') 
str(df.t)

# R is smart, but it doesn't understand your experimental design.
# R interpretes temp as a number. But we don't know the actual temp. # temp really is a stand in for low and high. Change temp to a factor 
df.t$temp <- factor(df.t$temp)

#Let's look at growth rate as a function of temperature and population
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop)
# Let's make that plot nicer:
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop,
        names = c('10', '20', '10', '20'), #Temperature label
        at = c(1, 2, 4, 5), # space out the boxes according to population 
        ylab = 'Growth rate mm/day',
        xlab = ''
        )
# Introducing the 'mtext' command to add margin text
mtext('Pop 1', side = 1, at = 1.5, line = 3) 
mtext('Pop 2', side = 1, at = 4.5, line = 3)

# Now make save it to a .pdf
pdf('results/MyBoxplot.pdf', width = 5, height = 5) 
# (just copying and pasting above code) 
boxplot(df.t$growthRate ~ df.t$temp + df.t$pop,
        names = c('10', '20', '10', '20'), #Temperature label
        at = c(1, 2, 4, 5), # space out the boxes according to population ylab = 'Growth rate mm/day',
        xlab = ''
        )
# Introducing the 'mtext' command to add margin text
mtext('Pop 1', side = 1, at = 1.5, line = 3) 
mtext('Pop 2', side = 1, at = 4.5, line = 3)

# The '*' symbol is for multiplication and means we want to evaluate an interaction
m1 <- aov(df.t$growthRate ~ df.t$temp * df.t$pop) # To see the results, use the "summary" command 
m1.summary <- summary(m1)
m1.summary
dev.off()

#save our summary as an R object
saveRDS(m1.summary, 'results/m1.summary.rds')

#Checkpoint 4: How do we interpret this summary?
#The p values are on the far right and the variable they are calculated 
#for are on the far left. The third row looks at the interaction of temperature 
#and population, as in did temperature vary differently by population. 
#Temperature had a p value less than 0.1 but greater than 0.05, which some
#interpret as slight significance.

#Checkpoint 5. What did we just do? Do you think this approach is easily editable and reproducible?
#We made a script called driver to keep track of our other scripts which show the correct workflow
#In that driver script you tell it to run other scripts!
#This makes it easier when many scripts are part of an analysis and makes 
#the correct workflow easy to follow by essentially automating it.
#It makes your analysis more reproducible but if your workflow changes you must 
#also change your driver.



