?matrix
my.data <- 1:2

#GOES COL WISE
A <- matrix(my.data,4,5)
A
A[2,3]

#GOES ROW WISE
B <- matrix(my.data,4,5, byrow = T)
B
B[2,5]

#rbind()

r1 <- c("i", "am", "happy")
r2 <- c("what", "a", "day")
r3 <- c(1,2,3) #NUMBERS ARE GOING TO BE CONVERETED TO CHARACTERS BECAUSE THE OTHERS ARE IN CHARACTER
C <- rbind(r1,r2,r3)
C

#cbind

c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

matrix(27,3,5)


#naming rows and col

# you can name vectors too - c(1,2,3,4) can have names too lile a,b,c,d

# Named Vectors

charlie <- c(1:5)
charlie

#Give names

names(charlie) <- c("a","b","c","d","e")
charlie
charlie["d"]

names(charlie) # names of charlie are a.b.c.d.e

#how to clear names

names(charlie) <- NULL
charlie

#naming matrix dimensions


temp.vec <- rep(c("a","B", "zZ"),3)

c("a","B", "zZ")

temp.vec


#or 
temp.vec <- rep(c("a","B", "zZ"),times=3)
temp.vec

#or 
temp.vec <- rep(c("a","B", "zZ"),each=3)
temp.vec

#all to just play around

temp.vec <- rep(c("a","B", "zZ"),each=3)
temp.vec

bravo <- matrix(temp.vec,3,3)
bravo

rownames(bravo) <- c("how", "are", "you")
bravo

colnames(bravo) <- c("x","y","z")
bravo

#to put zero in the middle
bravo[2,2] <- 0
bravo


#to remove rownames
rownames(bravo) <- NULL
bravo



















