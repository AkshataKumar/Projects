#vectorised operations

#part1

x <- rnorm(5)
x

#r specific proframming loop
for (i in x) {
  print(i)
}

#to print the individual values in x
print(x[1])

print(x[2])

print(x[3])

print(x[4])

print(x[5])

print(x)


#conventional programming loop  
for (j in 1:5) {
  print(x[j])
}

#iterate over the value of the vector

#part 2

n <- 100
a <- rnorm(n)
b <- rnorm(n)

#difference between vectorised approach and devectorised approach

#Vectotised approach
c <- a*b

#devectorised approach

d <- rep(NA,n) #by doing this we have created a vector that has 100 emplty spaces in it. used rep to create NA/empty space, n times ie 100 times

for (i in 1:n) {
  d[i] <- a[i] * b[i]
}

#devectorised takes much longer. in languages like c they need things to be broken into much tiny pieces to make them run faster
#but not in r














