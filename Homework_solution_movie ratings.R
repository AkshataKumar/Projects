getwd()
films <- read.csv("HomeworkData2.csv", stringsAsFactors=TRUE) #dont forget the name of the file is also .csv and the string thing

#simple data explorations
head(films)
summary(films)
str(films)

colnames(films)
colnames(films) <- c("ReleaseDay", "Director", "Genre", "MovieTitle", "ReleaseDate", "Studio", "AdjustedGrossMillions", "BudgetMillions","GrossMillions", "IMDBrating", "MovieLensRating","OverseasRevenueMillions","OverseasPercentage", "ProfitMillion", "ProfitPercentage", "Runtime", "USrevenueMillions", "GrossPercentageUS")
colnames(films)

ggplot(data = films, aes(x=ReleaseDay)) + geom_bar() #relase mostly on friday

#filtering dataframa 
filt <- films$Genre == "action" #created a variable filt such that from films folder, genre col we have only action movies
films2 <- films[filt,] #then created variable which is version 2 of orignal file such that it has only action and all other col.
films2

#right now we need to filter action, adv, animation, comedy, drama so
filt <- (films$Genre == "action") | (films$Genre == "adventure") | (films$Genre == "animation") | (films$Genre == "comdey") | (films$Genre == "drama")
films2 <- films[filt,]
films2

#need to filter studios too

filt2 <- films$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")
#means that if movie studios is any of these then its true

filt #true and false: is the genre data action,adv..
filt2 #tru and false thing : is the studio WB,Fox, ..

#now combining the two filters
films2 <- films[filt & filt2,]
films2

##Creating the GGPLOT

p <- ggplot(data=films2,aes(x=Genre, y=GrossPercentageUS))
p + geom_point() #simply points #random check

p + geom_boxplot() #we have multiple outlier

p + geom_jitter() + geom_boxplot(alpha=0.6) #alpha makes box transparant

p + geom_jitter(aes(size=BudgetMillions, colour=Studio)) + geom_boxplot(alpha=0.6)

#removing outliers of the boxplot because the outliers do get captured by jitter as well, so dont need the boxplot outliers
p + geom_jitter(aes(size=BudgetMillions, colour=Studio)) + geom_boxplot(alpha=0.6,outlier.colour = NA)

#just naming our visualisation q
q <- p + geom_jitter(aes(size=BudgetMillions, colour=Studio)) + geom_boxplot(alpha=0.6,outlier.colour = NA)
q


q <- q + xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
q

q <- q + theme(axis.title.x = element_text(colour="Blue", size=10),
               axis.title.y = element_text(colour="Blue", size=10),
               axis.text.x = element_text(size=10),
               axis.text.y = element_text(size=10),
               plot.title = element_text(size=20),
               legend.title =element_text(size=10),
               legend.text =element_text(size=10),
               text = element_text(family = "TT Times New Roman")
               )
q

#detour to install fonts package onto R
install.packages("extrafont")
loadfonts(device = "win")
font_import()
y
n

q <- q + theme(axis.title.x = element_text(colour="Blue", size=10),
               axis.title.y = element_text(colour="Blue", size=10),
               axis.text.x = element_text(size=10),
               axis.text.y = element_text(size=10),
               plot.title = element_text(size=15),
               legend.title =element_text(size=10),
               legend.text =element_text(size=10),
               text = element_text(family = "TT Times New Roman"))
q

#final touches

q$labels$size <- "Budget $M"
q


























