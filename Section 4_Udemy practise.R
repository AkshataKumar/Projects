#BUILDING CHARTS
#4.1 HISTOGRAMS
#using file demography
getwd()
demography <- read.csv("3. demographics.csv", stringsAsFactors = TRUE)
View(demography)

#making histogram of income
install.packages("ggplot2")
ggplot() + geom_histogram(data = demography, aes(x=income))
#bettering it
ggplot() + 
  geom_histogram(data = demography,  aes(x=income), fill="yellow", colour= "black")

#adding y axis as density
ggplot() + 
  geom_histogram(data = demography,  aes(x=income, y=..density..), fill="yellow", colour= "black")

#now if u want to show income density but gender wise and also marital status wise
ggplot() + 
  geom_histogram(data = demography, binwidth = 20,  aes(x=income, y=..density..), fill="blue", colour= "black") + facet_grid(gender~marital)

# suppose i want the orignal graph of income and density but in the same histogram i wanna see male and female
ggplot() + 
  geom_histogram(data = demography, binwidth = 10, aes(x=income, y=..density..,fill=gender) , colour= "black")

#this fill here as gender must be a factor

#----------------------------------------------------------------------------#

#4.2 DRAWING CUM FREQ LINE CHARTS
#Using variable income here too

install.packages("plyr")
library(plyr)

mydata <- count(demography, 'income')
View(mydata)

#we have income and freq, now finding cum counts and cum %
cumul <- cumsum(mydata$freq)
cumper <- cumul/nrow(demography)

mydata <- cbind(mydata, cumper)
View(mydata)

#now we plot these
ggplot() +
  geom_line(data = mydata, aes(x=income, y=cumper))

ggplot() +
  geom_step(data = mydata, aes(x=income, y=cumper))

#Suppose you want the cum freq line for male and female separately using the same data
#we start by splitting the data into male and female

male <- demography[demography$gender == "Male", ]
female <- demography[demography$gender == "Female", ]
View(male)

colnames(demography)
summary(demography)
head(demography)

#now computing the cum freq for male
mydata_male <- count(male, "income")
cumulm <- cumsum(mydata_male$freq)
cumpercm <- cumulm/nrow(male)
mydata_male <- cbind(mydata_male, cumpercm)
View(mydata_male)
#for female
mydata_female <- count(female, "income")
cumulf <- cumsum(mydata_female$freq)
cumpercf <- cumulf/nrow(female)
mydata_female <- cbind(mydata_female, cumpercf)
View(mydata_female)

#drawing the final freq line using ggplot2
ggplot()+geom_line(data=mydata_male, aes(x=income, y=cumpercm), color="red")+
  geom_line(data=mydata_female, aes(x=income, y=cumpercf), color="blue")

#Adding legends: this happnes by creating a new variable first and then using the function scale_color_manual
lgd <- scale_color_manual("Legend", values=c(Male="red", Female="blue"))
ggplot()+
  geom_line(data=mydata_male, aes(x=income, y=cumpercm, color="Male"), size=1.3)+
  geom_line(data=mydata_female, aes(x=income, y=cumpercf, color="Female"), size=1.3)+
  lgd

#----------------------------------------------------------------------------#
#4.3 Drawing column charts
























































