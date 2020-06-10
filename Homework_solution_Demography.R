getwd()

demography <- read.csv("HomeworkDataDemo.csv", stringsAsFactors = TRUE)

head(demography)
tail(demography)
str(demography)
summary(demography)

#changing year to factor
demography$Year
temp <- factor(demography$Year)
temp

#Splitting dataframe 
demography$Year==1960 #true and false thing
demography1960 <- demography[demography$Year==1960,]
demography1960 

demography$Year==2013 #true and false thing
demography2013 <- demography[demography$Year==2013,]
demography2013

nrow(demography1960) #187
nrow(demography2013) #187

#Creating our data frame

add1960 <- data.frame(Code=Country_Code, Life.exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.exp=Life_Expectancy_At_Birth_2013)

summary(add1960)
summary(add2013)

#merging data frames

merged1960 <- merge(demography1960, add1960, by.x = "Country.Code", by.y = "Code")
merged2013 <- merge(demography2013, add2013, by.x = "Country.Code", by.y = "Code")

str(merged1960)
str(merged2013)

#deleting the col of year 
merged1960$Year <- NULL
merged2013$Year <- NULL

#PLOTTING

qplot(data = merged1960, x=Fertility.Rate, y=Life.exp,
      colour=Region, size = I(3), alpha = I(0.6),
      main = "Life Expectancy vs Fertility 1960"
      )


qplot(data = merged2013, x=Fertility.Rate, y=Life.exp,
      colour=Region, size = I(3), alpha = I(0.6),
      main = "Life Expectancy vs Fertility 2013"
)

























