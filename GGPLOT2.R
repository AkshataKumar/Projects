##GGPLOT2

#the grammer of graphics:
#1. data
#2. Aesthetics
#3. Geometries
#4.Stats
#5. Facets
#6. Co-ordinates
#7. Theme

#1. Data

#What are factors?

getwd()
setwd("C:\\Users\\Akshata Kumar\\Desktop\\Udemy_Rprogramming")

movies <-read.csv("Movie Ratings.csv", stringsAsFactors=TRUE) #again using stringsasdactors=true, otherswise in str we cant seee which is a factor and which is integer etc
head(movies) #there are some dots in our result that is becasue R cant read certain things like brackets etc
#so to fix it
colnames(movies)
colnames(movies) <- c("Films", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year") #simply replace col headings to what you want to name it
head(movies)
tail(movies)
str(movies)
#dECIPHENING str
#films saved as factors
#genre saved factor - gets saved as 1234...so first genre becomes 1 then 2..R alots this. ignore it
summary(movies)
#year mentioned in the summary col, has calculated min max median mean but for years we dont need these. year is year, no need to calculte these things and so we convert years to facctors
#words in r are usually taken as factors but when r sees nummbers it just assumes you will be using it to calculate things but its not true for years
#converting years to factors
factor(movies$Year) #this converts yeara to factors
movies$Year <-factor(movies$Year) # this is where we're just assigning it to the same col
#so convert and then assign too

summary(movies) #to see if its converted or not

# so have to decide what you want data nature to be. should it be factor or integer

#--------------------------------------------------------------------------------#

#2. Aesthetics

?ggplot()
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
#aes is how data layers
#need to add details of the plot like if u want lines or dots or bubbles
#so we will add to the above code
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()
#dots appear
#now just adding color
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) +
  geom_point()  
#now adding size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=Genre)) +
  geom_point() 
##now the genre that has a higher number has a bigger bubble too
##but this shows us an error in r sauing not advised

#so nw we use size as budgetmillions
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) +
  geom_point() 
##now onlu big budger gas bigger bubbles

###this is one of our OBSERVATIONS

#--------------------------------------------------------------------------------#

#3. Geometry
#plotting with layers

p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) #saved the whole thing under letter P nad so in environment a new variable is created which if expanded upon has multiple sets of info in it

p + geom_point()
#p has the data and our aes and now we will add our layers to it

p + geom_line() #now we can use p and make it a line
#p is x,y,size

#multiple layers
p + geom_line() + geom_point() #jsut random eg

#-----------------------------------------------------------------------------#
##over riding aes

q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

q + geom_point() #layering

q + geom_point(aes(size=CriticRating)) #all points of critic are greater for every genre becasue we over wrote that size was budget. re wrote it size being critic rating now

q + geom_point(aes(colour=BudgetMillions)) #another example where color is now based on budget and npt genre
#we are never over writing q itseld, we just use default q and make changes to it after tge + sign

q + geom_point(aes(x=BudgetMillions))
#even x and y can be overwritten
#here the budget is shown bigger with bigger bubbles, genre wise
#however the x axis is still names critic rating 

#fixing that:
q + geom_point(aes(x=BudgetMillions)) +xlab("Budget Millions $$$")


q +  geom_line(size=1) + geom_point() #to change size of line #didnt need to add aes

#--------------------------------------------------------------------------------#

##Mapping vs Setting

q + geom_point(aes(x=BudgetMillions)) +xlab("Budget Millions $$$")

r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#how to add color
#1. mapping
r+ geom_point(aes(colour=Genre))

#2.settings
r +geom_point(colour="DarkGreen")

#so aes is needing fixing a colour parameter which is genre, we want to map it. but if u just want to change the setting of the map and by color on the plot you simply type color and not aes

#nw just using examples
#mapping
r + geom_point(aes(size=BudgetMillions))
#setting
r + geom_point(size=2)
#do not do this
r + geom_point(aes(size=10)) #legend 10 #wrong input #no need to write aes # this is not a ccaategory or factor varibale
#--------------------------------------------------------------------------------#

#Histogram and density charts

s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)

#adding color
s + geom_histogram(binwidth = 10, aes(fill=Genre))
#adding a border#simply setting
s + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")

##density charts : #just one of the chart options ie probablity density chart
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position="stack")



#-------------------------------------------------------------------------------#
#layering tips

t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill="White", colour="Blue") # border it blue and fillit white
##there is another way where t is simply ggplot and data and then u can layer aes and other thing in the next geom step, like this:

rm(t)
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating),
                   fill="White", colour="Blue") ##one of our charts

#another chart #helps if aes comes at this stage instead of overwriting
t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating),
                   fill="White", colour="Blue")
##feels more evenly rated#changes the normal distribution to uniform distributuion

##another possibility is to create a skeleton variable 
t <- ggplot() #thats it. this is done when you want to keep changing your data source or data=xx

#---------------------------------------------------------------------------------#

#Statistical Transformations

?geom_smooth

u <-ggplot(data=movies, aes(x=CriticRating, y=AudienceRating,
                            colour=Genre))#
u + geom_point() + geom_smooth(fill=NA) #SMOOTH ADDS TREND LINES, YOU CAN SEE PATTERNS CLEARLY
#ROMATIC Movies - less rated by critic high by audience
#Adv vs Horror - if critic rates them both 70, audiencce rates adv higher etc

##BOXPLOTS

u <- ggplot(data=movies, aes(x=Genre, y= AudienceRating, colour=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2) #sizing
u + geom_boxplot(size=1.2) + geom_jitter() #jitter is just another way to see the data properly, to recognize patterns and make trends
u + geom_boxplot(size=1.2) + geom_point() #jitter is better to use instead of geom point

u + geom_jitter() + geom_boxplot(size=1.2) #to make dots go awau from the boxes, so jitter and then boxplot on top of that
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) #to make boxes transparent #box superimposing the dots. layout thing

# interpretation: the line in the middle of the box is the mean, so mean rating likely to be received for each genre
#thriller - narrow box ie variance is low
##lowest box is horror movie 
##drama is highest

## different example of boxplot

a <- ggplot(data=movies, aes(x=Genre, y= CriticRating, colour=Genre))
a + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
rm(v)

##FACETS
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") #replotting from before
#beter to have histogram for each genre

v + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") + facet_grid(Genre~.)
#
#fixing scales
v + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") + facet_grid(Genre~., scales = "free")

#using facets for sccatterplots

w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w+ geom_point(size=3)
#facets
w + geom_point(size=3) + facet_grid(Genre~.) #1
w + geom_point(size=3) + facet_grid(.~Year) #2
w + geom_point(size=1) + facet_grid(Genre~Year) # final
w + geom_point(size=1) +geom_smooth() + facet_grid(Genre~Year) # adding smootj

##Important: fixing x and y co ordinates/ fixing the axis/also called zoom in or out of the graph

#limiting our axis

m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, colour=Genre))
m + geom_point()
#say you want to view just quadrant 1 or top rated movies

m + geom_point() + xlim(50,100) #you do get a warning where rows were actually removed
m + geom_point() + xlim(50,100) + ylim(50,100) #same warning
##now x and y start at 50 and end at 100

n <- ggplot(data=movies, aes(x=BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") + ylim(0,50) #warning:removes values

##now using zoom in a way that we dont miss any values

n + geom_histogram(binwidth = 10, aes(fill=Genre),colour="Black") + coord_cartesian(ylim=c(0,50))
#data is ther but chart is zoomed in and the chart looks cut off


w + geom_point(size=1) +geom_smooth() + facet_grid(Genre~Year) #here to fix axis

w + geom_point(size=1) +geom_smooth() + facet_grid(Genre~Year) + coord_cartesian(ylim = c(0,100))


##FINAL THEME

#Making things pretty
#an eg
o <- ggplot(data=movies, aes(x=BudgetMillions))
o + geom_histogram(binwidth = 10, aes(fill=Genre), colour= "Black")

#labeling axis
#faster if we save it as a numerable

#naming axis
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour= "Black")
h
h + xlab("Money Axis")
h + ylab("Number of Movies")

#formatting labels
h + xlab("Money Axis")+ ylab("Number of Movies") + theme(axis.title.x = element_text(colour= "Dark Green",size=30),
                                                         axis.title.y = element_text(colour = "Red", size = 30 ))

#formatting the tick marks on x and y axis
h + xlab("Money Axis")+ ylab("Number of Movies") + theme(axis.title.x = element_text(colour= "Dark Green",size=30),
                                                         axis.title.y = element_text(colour = "Red", size = 30 ),
                                                         axis.text.x = element_text(size=20),
                                                         axis.text.y = element_text(size=20))
#the whole theme code needs to be memorised. 
?theme


#formatting the legends (size/positioning)
h + xlab("Money Axis")+ ylab("Number of Movies") + theme(axis.title.x = element_text(colour= "Dark Green",size=30),
                                                         axis.title.y = element_text(colour = "Red", size = 30 ),
                                                         axis.text.x = element_text(size=20),
                                                         axis.text.y = element_text(size=20),
                                                         
                                                         legend.title = element_text(size=30),
                                                         legend.text = element_text(size=20),
                                                         
                                                         legend.position = c(1,1),
                                                         legend.justification = c(1,1))

#the four corners of the axia are (0,0) (1,0) (0,1) (1,1), 0 is left

#formatting a title to the plot
h + xlab("Money Axis")+ ylab("Number of Movies") + ggtitle("Movie Budget Distribution")+ 
  theme(axis.title.x = element_text(colour= "Dark Green",size=30),
                                                         axis.title.y = element_text(colour = "Red", size = 30 ),
                                                         axis.text.x = element_text(size=20),
                                                         axis.text.y = element_text(size=20),
                                                         
                                                         legend.title = element_text(size=30),
                                                         legend.text = element_text(size=20),
                                                         
                                                         legend.position = c(1,1),
                                                         legend.justification = c(1,1))

#formatting that title further

h + xlab("Money Axis")+ ylab("Number of Movies") + ggtitle("Movie Budget Distribution")+ 
  theme(axis.title.x = element_text(colour= "Dark Green",size=30),
        axis.title.y = element_text(colour = "Red", size = 30 ),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "Dark Blue",
                                  size = 40, family = "Courier"))



































w + geom_point(aes(size=BudgetMillions)) +geom_smooth() + facet_grid(Genre~Year)



























