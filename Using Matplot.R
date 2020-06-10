?matplot()

FieldGoals

#VVVVVVVVIP
#matplot plots each col so for field goals it would plot 2005 then 2006 2007 but we want Kobe's 2005,6,7.. or each row as one
#kobe - all years - all goals scored - one color
#next would be joe - all years - all goals scored - another color
# so on and so forth
#thus we need to transpose it. Make years as rows and names of each player as col

t(FieldGoals)

matplot(t(FieldGoals), type="b", pch=15:18, col=c(1:4,6))

legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))


#measuring accuracy
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))

legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


#others to be tried:
#salary per points or points oer game or points per min played

