
#plotting min played by all players in the past 10 years

matplot(t(MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))

legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#using subset

data <- MinutesPlayed[1,]
matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

data #our new data and new chart
#our data again is not a matrix, its a vector

#solution

data <- MinutesPlayed[1,,drop=F]
matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)












