#Subsetting

x <- c("a","b","c","d","e")
x
x[c(1,5)] #need to use c
x[1] # no need to use c because you need only one value here
#this is a way of subsetting

Games
Games[1:3,6:10] #subset of matrix is also matrix

#making it blank selects it all
Games[c(1,10),]

#both methods can be used
Games[1:10,4:5] 
Games[,c("2008","2009")]

#to get just kobe bryan all years
Games[1,1:10]
Games[1,]
#but the result is not a matrix, its a vector

is.vector(Games[1,])


Games[1,5]
#again this is a vector

#this is because its a default behaviour of the sq brackets. here r is guessing thbat if u wanted such data youre not looking for it to be in a matrix form so it returns just vectors to you

#THUS USE DROP AS FALSE, nothing is getting dropped

Games[1,,drop=F]
Games[1,5,drop=F]

#so if u dont want r to guess, then tell r what to do (drop)





