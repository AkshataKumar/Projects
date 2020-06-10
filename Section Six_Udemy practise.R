#Section 6 Performing univariate analyses
#6.1 One sample t test:  A one-sample t-test is used to test whether a population mean is significantly different from some hypothesized value.
#compares mean of the sample to another mean value usually its the population
#Assumptions:
#1. variable is normally distributed
#2. There are not many outliers

#using the ttest
t.test(demography$income, alternative = "two.sided", mu=70)
#here we have picked alternative as two sided value as we want to run a two sided t test
#and 70 is our theoritical mean that we have picked

#Results:
#mean of our sample is 78.5
#here our t = 1.7282 and p value is 0.08
#since p value is greater than 0.05, we accept the null that our sample mean is not signficantly different from 70, practically similar to 70
#our confidence interval for 95% is 68.82 and 88.36


#6.2 Binomial Test: In statistics, the binomial test is an exact test of the statistical significance of deviations from a theoretically expected distribution of observations into two categories.
#comparing significant diff in the two distributions, its dichotomous
#Checking for male female population being 50-50

#Creating a count function for no of males and females
mytable = table(demography$gender)
print(mytable)

#Running binomial test using function
binom.test(mytable, p=0.50, alternative = "two.sided", conf.level = 0.95)

#prob of success is 49.01% = 250/510 and successes here is female (as female was the first value)
#comparing it to 50% prob, p value = 0.69 which is greater than 0.05 so accepting null
#meaning it is significantly equal to 50%

#Another test for, males proportion being 60% (p=0.40 not .60 as the values are for female)
binom.test(mytable, p=0.40, alternative = "two.sided", conf.level = 0.95)
#Result: p value is less than 0.05 therefore rejecting null of male being 60% of proportion

#6.3 Chi test for judging goodness of fit
#Using variable educational levels
#Generating count function

mtable = table(demography$educ)
n <- length(mtable)
print(n) #5 cols as variable has 5 levels
thprop <- 1/n
print(thprop)
chisq.test(mtable, p=rep(thprop,n)) #rep is repeat function to be repeated n times or 5 times

#p value very low so rejecting goodness of fit
# edu levels do not have an equal distribution

chisq.test(mtable, p=rep(thprop, n))$expected
chisq.test(mtable, p=rep(thprop, n))$residuals #observed - expected
chisq.test(mtable, p=rep(thprop, n))$stdres

### run the chi square test
### with UNequal theoretical probabilities
chisq.test(mtable, p=c(0.30,0.30,0.20,0.10,0.10)) #still lower than 0.05 thus rejecting null
chisq.test(mtable, p=c(0.30,0.30,0.20,0.10,0.10))$expected #these are counts














































