


function(Data,rows=1:10){
  data <- Data[rows,,drop=F]
  matplot(t(data), type="b", pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}

myplot(Games)

#analysing:

#1. salary
myplot(Salary) #whats been their salary over 10 years
myplot(Salary/Games) #what are they payed per game
#result : kobe and derrick's salary seems to be high/game thats becasue they had injury so couldnt play those many games, they obviously still got paid
#thus salary per game may not be the bext judge becasaue we could have anomolies due to injuries, its quite common
#thus not a measure for scores/how good their game is 
myplot(Salary/FieldGoals)

#2. in-game metrics : thus we use ingame mins played to judge them
myplot(MinutesPlayed)
myplot(Points) # injuris affecte here too so need to take injuries out of the pic

#3. Normalised in-game metrics
myplot(FieldGoals/Games) # scores per game they actually played
myplot(FieldGoals/FieldGoalAttempts) #accuracy of the players
myplot(FieldGoalAttempts/Games)
#one obser from goals per attempt is that dwight got the highest accuracy and hes the 5th highest player
#but when we check hjow many attempts he made each game, result is lowest attemots made to score a goal in a game
#no of attempts made is less , could be due to any amt of reasons. need domain knowledge to judge
# so maybe its fine that he gets 5th posn salary

#4. observation of mins played going down
myplot(MinutesPlayed/Games)
#all players now play less mins in the game nw
myplot(Games) # even though no of games they play is consistent

#5. Time observation
myplot(FieldGoals/MinutesPlayed) 
#kevin - young rising star, using his time valuably
#2 clusters are formwd 4 optimise field time more than the rest 6

#6. Player Style
myplot(Points/FieldGoals) # is it 2 or3 points # or more free passes
