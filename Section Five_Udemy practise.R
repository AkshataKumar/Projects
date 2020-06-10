#5.1
getwd()

#Using Shapiro Wilk test to determine normality of data
demography <- read.csv("3. demographics.csv", stringsAsFactors = TRUE)

#Performing basic functions in R to scan data
colnames(demography)
head(demography)
tail(demography)
summary(demography)

#Checking for normality for the variable "income" in the demography csv file
shapiro.test(demography$income)
#The value of the shapiro wilk test is 0.48832 and p value is less thatn 0.05/0.01
# If p value is more than 0.05, we accept the null hypothesis and say income is normally distibuted
#Since p value here is less than 0.5/5%, we reject the null hypothesis and conclude that variable income is not normally distributed

#5.2
#Checking for normality of a variable using a histogram

#We start by calculating the mean and standard deviation of the variable, which will help draw the normal distibution curve
mean <- mean(demography$income)
std <- sd(demography$income)

#Now we build the histogram using ggplot2 and also add the normal distibution curve to the diagram

ggplot() + geom_histogram(data=demography, aes(x=income, y=..density..), fill="yellow") + stat_function(fun=dnorm, args= list(mean = mean, sd = std), aes(x=demography$income))
#from the histogram we cn tell that the variable is not following a normal distibution, it is right skewed
#Here the low values are more than higher values of income

#5.3 Working with outliers - using standardized values
#We will first convert all values to standardized values using the function "Scale"
zinco <- scale(demography$income, scale = TRUE)
sort(zinco, decreasing = TRUE)#sorting

#first row consists of all extreme values from 9.24 til actually 3.55, these are the outliers






