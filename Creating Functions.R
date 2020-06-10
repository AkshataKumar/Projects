#codes that we keep copying around
#eg

data <- MinutesPlayed[1,,drop=F]
matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

#possible to save the above as function
#creating a function

myplot <- function(){
  data <- MinutesPlayed[2:3,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[2:3], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot()

  
#to make sure we dont have to keep changing players numbers
#replace the players numbers/row values and just write row instead
myplot <- function(rows){
  data <- MinutesPlayed[rows,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

#now i type the rows i want over here, say top 5 players
myplot(1:10)

#now instead of changing another matrix from mins played to points scored or salary etc # here we changed it to Data BUT NOT TO BE CONFUSED WITH samll letter data, its DIFFERENT, NOT RELATED
# we can change that too and make function flexible

myplot <- function(Data,rows){
  data <- Data[rows,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Salary, 1:10)
myplot(Salary,1:2)

#similarly we can fix the rows to say that whaterver matrix we run, we want the plots to have all 10 players, so fixing rows
myplot <- function(Data,rows=1:10){
  data <- Data[rows,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Salary)
#by default not salary has all 10 players











