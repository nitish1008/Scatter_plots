getwd()
pf = read.csv("pseudo_facebook.tsv", sep = '\t')
str(pf)
library(rmarkdown)
qplot(x = age, y = friend_count, data = pf)
library(ggplot2)
qplot(x = age, y = friend_count, data = pf)
str(pf)
pf <- read.csv("pseudo_facebook.tsv", sep = '\t')
str(pf)
library(ggplot2)
qplot(x = age, y = friend_count, data= pf)
qplot(age, friend_count, data = pf)
ggplot(aes(x= age, y = friend_count), data = pf)+
  geom_point(alpha  = 1/20, position = position_jitter(h =0)) + 
  xlim(13, 90)+
  coord_trans(y = "sqrt")
names(pf)
install.packages("dplyr")
library(dplyr)
library(dplyr)
install.packages("dplyr")
library(dplyr)
pf.fc_by_age <- group_by(pf, age)
pf.fc_by_age
head(pf.fc_by_age)
pf.fc_by_age <- summarise(pf.fc_by_age, friend_count_mean = mean(friend_count),
                          friend_count_median = median(friend_count), n = n())
pf.fc_by_age
head(pf.fc_by_age)
pf.fc_by_age<- arrange(pf.fc_by_age, age)
head(pf.fc_by_age)
head(pf.fc_by_age, 20)
#another method to do the above summarisation
age_groups <- group_by(pf, age)
pf.fc_by_age <- pf %>% group_by(age) %>%
  summarise(friend_count_mean = mean(friend_count), 
                                     friend_count_median = median(friend_count), 
                                     n = n()) %>%
              arrange(age)
  head(pf.fc_by_age)          
#plot of age by mean friend count using the new data frame pf.fc_by_age
ggplot(pf.fc_by_age, aes(age, friend_count_mean))+
  geom_line()+
  xlim(13, 90)
#some summaries over the plot of age by friend_count having friend_count between 0 and 1000
ggplot(pf, aes(age, friend_count))+
  geom_point(alpha = 1/20, position = position_jitter(h = 0), color = 'orange')+
  coord_trans(y = "sqrt")+
  geom_line(stat = 'summary', fun.y = mean)+
  geom_line(stat = 'summary', fun.y = quantile, prob = 0.1, linetype = 2, color = 'blue')+
  geom_line(stat = 'summary', fun.y = quantile, prob = 0.9, linetype = 2, color = 'green')+
  geom_line(stat = 'summary', fun.y = quantile, prob = 0.5, color = 'red')+
  coord_cartesian(xlim = c(13, 30), ylim = c(0, 1000))
help("coord_cartesian")
#Coorelation between age and friend_count
cor(pf$age, pf$friend_count)
cor.test(pf$age, pf$friend_count, method = "pearson")
with(pf, cor.test(age, friend_count, method ="pearson"))
help("cor.test")
with(subset(pf, age<=70), cor.test(age, friend_count, method = "pearson"))#pearson method
with(subset(pf, age<=70), cor.test(age, friend_count, method = "spearman"))#Spearman method
#Scatter plot between wwe_likes_received and likes_received
ggplot(pf, aes(www_likes_received, likes_received))+
  geom_point(alpha = 1/20, position = position_jitter(h = 0))+
  coord_trans(y = 'sqrt')
summary(pf$www_likes_received)
