getwd()
install.packages("alr3")
library(alr3)
data("Mitchell")
names(Mitchell)
str(Mitchell)
summary(Mitchell)
#Scatter plot between month and temperature
library(ggplot2)
ggplot(aes(Month, Temp), data = Mitchell)+
  geom_point()
cor.test(Mitchell$Month, Mitchell$Temp)
ggplot(aes(Month, Temp), data = Mitchell)+
  geom_point()+
  scale_x_discrete(breaks = seq(0, 203, 12))  #yearly break in x-axis

#overlaying each year's data on top of each other
ggplot(aes(x = (Month%%12), y = Temp), data = Mitchell)+
  geom_point()
#saving plot in jpeg file
jpeg(file = "monthvstemp.jpeg")
ggplot(aes(Month, Temp), data = Mitchell)+
  geom_point()+
  scale_x_discrete(breaks = seq(0, 203, 12))
dev.off()

