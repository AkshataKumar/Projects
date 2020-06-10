getwd()
setwd("C:\\Users\\Akshata Kumar\\Desktop\\Statistics and R")
getwd()

demography <- read.csv("3. demographics.csv", stringsAsFactors = TRUE)
demography

# 1. Video - Filtering using brackets

#Suppose we want to filter out only females
demography2 <- demography[demography$gender=="Female",]
demography2

# first - you will name is demography 2
# you will mention your dataset as demography
# then use square brackets to tell us what is fized using $
# then use == to mention specific selection
# do not forget , at the end

View(demography2) #this command makes a new window appear in r which is the excel file

#Suppose we want to filter income >100
demography2 <- demography[demography$income > 100,]

colnames(demography)

View(demography2)

#Suppose you want only some col

demography2 <- demography[demography$income > 100, c(1,3,7)]
View(demography2)

#Suppose you want all col but not a few
demography2 <- demography[demography$income > 100, -c(6:8)]
View(demography2)

rm(demography2)

#if you want both to satify
demography2 <- demography[demography$gender== "Female",]
View(demography2)

demography3 <- demography2[demography2$income > 100,]
View(demography3)

#or you can use just one command
demography4 <- demography[demography$gender =="Female" & demography$income > 100,]
View(demography4)



summary(demography)
head(demography)

#--------------------------------------------------------------#
#2. Video - Filtering using Subset command

rm(demography2,demography3,demography4)

#Filtering only married subjects
demography2 <- subset(demography, marital == "Married")
demography2 
#here we used the subset function and picked the dataset first, then the col name, then our criteria which here is == married

#Filtering only married subjects whose ages are over 35
demography2 <- subset(demography, marital == "Married" & age > 35)
demography2

colnames(demography)


#Filtering only married subjects whose ages are over 35 but not only few rows
demography2 <- subset(demography, marital == "Married" & age > 35, select = c(1:3))
demography2

#Filtering only married subjects whose ages are over 35 and say you dont want some cols
demography2 <- subset(demography, marital == "Married" & age > 35, select = -c(4:6,8))
demography2

#--------------------------------------------------------------#

#3. Video - Filtering using dplyr

#Filtering only unmarried women
demography2 <- filter(demography, marital == "Unmarried")
demography2

#Filtering unmarried and below 50
demography2 <- filter(demography, marital == "Unmarried", age <50)
View(demography2)
# here we dont use ",select" or "&", we simply use ","

#Filtering unmarried and below 50, but want cols only age, marital status and income
demography2 <- select(demography,age,marital,income)
demography2 <- filter(demography2, marital == "Unmarried", age <50)
View(demography2)

#-------------------------------------------------------------#
#5. Recoding Categorical Variables
#say we want to rename the cols or rows
# here we want male to be 1 and female 2

demography$gender2[demography$gender == "Male"] = "1" #here we say that we want to create a variable gender 2 within demography and if gender is male then new value is 1, if gender is female then new value is 2
demography$gender2[demography$gender == "Female"] = "2" #here we say that we want to create a variable gender 2 within demography and if gender is male then new value is 1, if gender is female then new value is 2
View(demography) # new col is created gender2

#Using plyr package for the same
install.packages("plyr")

demography$gender3 <- revalue(demography$gender, c("Male"="1", "Female"="2"))
View(demography) #using combined function, both pairs is paranthesis

##this works only on factors to always convert to factor

str(demography)

#if u dont want to create gender 3 and just rewrite

demography$gender <- revalue(demography$gender, c("Male"="1", "Female"="2"))
View(demography)

#-----------------------------------------------------------#

#6. Recoding continious varibale (above was categorical, this is cont)

#we want to create: 2 groups low income and high income, where income under 200 is low and above 200 is high
#creating a new varibale called incat or income category

demography$incat[demography$income<200] = "Low income"
demography$incat[demography$income>=200] = "High income"
View(demography)

#now we want to create three groups by income: low income - under 150, medium income - between 150 and 300 and high income - 300 and more

demography$incat2 = cut(demography$income, breaks = c(-Inf,150,300,Inf), labels = c("Low income", "Medium income", "High income"))
#lower and upper limits are lower infinity and upper is infinity and then 150,300
#so now our groups are -inf to 150, 150 to 300, 300 to inf
View(demography)

#-----------------------------------------------------------#
#7. Sorting out a data frame

# say we want to sort out our data demography using income, in an ascending manner which is the default
demography2 <- demography[order(demography$income),] 
View(demography2)

#to use income but in descending order
demography2 <- demography[order(-demography$income),] 
View(demography2)
rm(demography2)
#Suppose you want to sort by income and age both
demography2 <- demography[order(demography$income, demography$age),] 
View(demography2)
#So within the same income, the age which is less comes first

#Suppose you want income and age sorting but income to be ascending and age to be descending
demography2 <- demography[order(demography$income, -demography$age),] 
View(demography2)


#-------------------------------------------------------------#

#Computing a new variable
getwd()
setwd("C:\\Users\\Akshata Kumar\\Desktop\\Statistics and R")
getwd()

math <- read.csv("4. math.csv", stringsAsFactors = TRUE)
math
#creating a varible that saves the difference b/w grade 1 and grade 2

math$diff = math$grade2 - math$grade1 #so two main things here are 1. we using = and not <- sign becasue its an arithmatic operation and 2. we name the new col math$diff, using the data name math and then dollar 
View(math)

#another eg
math$avg = (math$grade1 + math$grade2) / 2
View(math)



















