#SECTION 4 : CREATING FREQ TABLES

#Building a frequency table for the variable education in file demo
#The table captures the count, cum absolute freq, relative freq, and cum relative freq

#Creating simply count
mytable <- table(demography$educ, exclude = NULL) #to ignore missing values
mytable
print(mytable)

#Creating cum count
cumulative <- cumsum(mytable)
cumulative

#Computing relative freq
relative <- prop.table(mytable)
relative



#Computing cum rel freq
n <- nrow(demography)

cumrelfreq <- cumulative/n
cumrelfreq

#Making one big table
finaltable <- cbind(Freq=mytable, Cumul=cumulative,Relative = relative, CumFreq = cumrelfreq)
finaltable




##took a break

getwd()
setwd("C:\\Users\\Akshata Kumar\\Desktop\\Statistics and R")
getwd()

demography <- read.csv("3. demographics.csv", stringsAsFactors = TRUE)

##INCOMPLETE


#---------------------------------------------------------------------------#
#3.3 Building cross tables using xtabs

View(demography)

#Cross table to be built has variables gender and carcat
?xtabs
install.packages("xtabs")

ct <- xtabs(~gender+carcat, data=demography)
ftable(ct)

#3.4 bUILDING CROSS TABLES USING CROSSTABLE IN GMODELS PACKAGE
install.packages("gmodels")
CrossTable(demography$gender, demography$carcat)
CrossTable(demography$gender, demography$carcat, digits=3, expected=TRUE, prop.r=TRUE, prop.c=TRUE,
           prop.t=TRUE, prop.chisq=TRUE, chisq = FALSE, fisher=FALSE, mcnemar=FALSE,
           missing.include=FALSE) #further settings













