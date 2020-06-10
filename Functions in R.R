
#examples of diff types of functions

rnorm(5,10,8) 
#can also write this as:
rnorm(n=5,mean= 10,sd=8) 
#can also choose to not mention either mean or sd and the default is taken
rnorm(n= 5,sd=8) 

?c()
c(1,7:9)


?seq()
seq(1,20,3)
seq(from=1, to=20, by=3)
seq(from=1, to=20, length.out = 100)
#length helped us find 100 nos bw 1 and 20


rep(5,10)
rep(5:6, times=10) # both repeated alternately
rep(5:6, each=10) # each repeated 10 times



print()
is.numeric()
is.integer()
is.double()
is.character()
typeof()


?sqrt()

x <- c("a", "b", "c")
A <- seq(from=10, to=20, along.with = x)
A
B <-sqrt(A)
B

paste()

#using the question mark