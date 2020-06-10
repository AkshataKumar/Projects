

myFirstVector <- c(3,45,56,732)
typeof(myFirstVector)
myFirstVector
is.numeric(myFirstVector)
is.integer(myFirstVector)
is.double(myFirstVector)

V2 <- c(3L,12L,234L,0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

v3 <- c("a","b23","hello")
v3
is.character(v3)
is.numeric(v3)

#If we try to mix up the characters with numbers then:
v3 <- c("a","b23","hello", 7)
v3
#you see that the number has been converted to character. it is in quotes in the environment and consol
#you cannot convert a character to a number, but can convert number to  character

is.character(v3)

#seq and colon are identical
seq(1,15)
1:15
seq(1,15,2)
z <- seq(1,15,4)
z


rep(3,50)
d <- rep(3,100)
d
# the square brackets for 3,3,3,3,3 is the count of 3s in that row

rep("a", 5)

x <- c(80,20)
rep(x,10)



