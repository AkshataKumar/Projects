
#SECTION 2 - DESCRIPTIVE STATISTICS

#2.1
getwd()
demography <- read.csv("3. demographics.csv", stringsAsFactors = TRUE)
View(demography)

#Computing mean
mean(demography$income)

#To create this new variable that stores the mean
m <- mean(demography$income)
print(m) # now m is stored as the mean

#Computing SD and Var
sd(demography$income)
var(demography$income)

#Computing min max
min(demography$income)
max(demography$income)
range(demography$income) #to get them together
max(demography$income) - min(demography$income)

#Computing Median
median(demography$income)

#Computing quartiles
quantile(demography$income)

#------------------------------------------------------------------------#

#2.2. Using Psych package

#Computing descriptive stats for income, age and carprice

colnames(demography)
#first we Create a matrix of the data we want to evaluate
 demography2 <- cbind(demography$age, demography$income, demography$carpr)
 demography2
 #now we give col names
 
 colnames(demography2) <- c("age", "income", "price")
 colnames(demography2)
 View(demography2)
 
 #Now using pych on the data
 
 install.packages("psych")
 describe(demography2) #BEAUTIFULLLLLLLL <3
 describe(demography2, na.rm = TRUE, trim = 0.1, check = TRUE)
 #na.rm will remove all na or missing values from memory or calculation
 #check = true means it will check for any non numeric data
 
 #---------------------------------------------------------------------------#
 
 #2.3 Using pastecs package
 
#Similarly creating matrix again, for age income and carprice
demography2 <- cbind(demography$age, demography$income, demography$carpr)
colnames(demography2) <- c("age", "income", "price")
install.packages("pastecs")
#in pastecs we now want to set some things as default in R
options(scipen = 100) #setting R to use standard notation and not exponential
options(digits = 2) # rounding off to two decimal points

stat.desc(demography2)
#from the answer table:
#nbr. val is number of values, number of null cases or na..

#--------------------------------------------------------------------------#

#2.4 Kurtosis and Skewness
install.packages("e1071")
skewness(demography$income) #right skewed distribution, values to the left are more
kurtosis(demography$income) # higher than 3, ie a sharp distributin and values concentrate around the mean

#------------------------------------------------------------------------#
#2.5 Using quantiles

#we want to compute 17,55 and 95% 
quantile(demography$income, probs = c(0.17,0.55,0.97))

# for simply quartiles
quantile(demography$income, probs = c(0.25,0.50,0.75))

#---------------------------------------------------------------------------#

#2.6 Finding mode
install.packages("modeest")
mlv(demography$income, method = "mfv") #most freq value = mfv
#----------------------------------------------------------------------------#

#2.7 Grouping or categorising the data

#here, separating by gender and say for income only
install.packages("doBy")
func <- function(x) {descStat(x, na.rm = TRUE)} #MISSING values to be removed
summaryBy(income~gender, data= demography, FUN = func)
#now separating by gender for income and also age
func <- function(x) {descStat(x, na.rm = TRUE)} #MISSING values to be removed
summaryBy(income+age~gender, data= demography, FUN = func)

#--------------------------------------------------------------------------#

#2.8 

library(psych)
#using the data income and level of education
# so categorising income as per levels of education

describeBy(demography$income, demography$educ) #Cant use it for more than 2 varibales
#-------------------------------------------------------------------------#

#2.9
#age categorised by  marital status

#to compute mean
aggregate(demography$age, by=list(demography$marital), FUN = mean,)
options(digits = 6)# to get it upto decimal points

#to compute sd
aggregate(demography$age, by=list(demography$marital), FUN = sd,)

#to compute median
aggregate(demography$age, by=list(demography$marital), FUN = median,)

#to compute variance
aggregate(demography$age, by=list(demography$marital), FUN = var,)

#say to compute stats for age but as per marital status and gender
aggregate(demography$age, by=list(demography$marital, demography$gender), FUN = mean,)




















 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 











