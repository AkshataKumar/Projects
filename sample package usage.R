install.packages("ggplot2")
library(ggplot2)

?qplot()
?ggplot

qplot(data=diamonds, carat, price, color=clarity, facets=.~clarity)