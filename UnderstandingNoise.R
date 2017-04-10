#Understanding noise
pf = read.csv("pseudo_facebook.tsv", sep = '\t')
str(pf)
library(ggplot2)
install.packages("dplyr")
library(dplyr)
#another method to do the above summarisation
age_groups <- group_by(pf, age)
pf.fc_by_age <- pf %>% group_by(age) %>%
  summarise(friend_count_mean = mean(friend_count), 
            friend_count_median = median(friend_count), 
            n = n()) %>%
  arrange(age)
head(pf.fc_by_age)   

#Understanding noise: Age to Age Months

p1 <- ggplot(aes(age, friend_count_mean), data = subset(pf.fc_by_age, age< 71))+
  geom_line()+
  geom_smooth()
head(pf.fc_by_age, 10)

#making new variable 'age_with_months'
pf$age_with_months <- NULL
pf$age_with_months <- pf$age + (12- pf$dob_month)/12
str(pf$age_with_months)

#Age with month means
pf.fc_by_age_months <- pf %>% group_by(age_with_months)%>%
  summarise(friend_count_mean = mean(friend_count), 
            friend_count_median = median(friend_count), n = n())%>%
  arrange(age_with_months)
head(pf.fc_by_age_months, 10)

# plot between friend_count_mean and the new variable, age_with_months

p2 <- ggplot(aes(age_with_months, friend_count_mean), data = subset(pf.fc_by_age_months, age_with_months< 71))+
  geom_line()+
  geom_smooth()+
  ylim(0, 500)
jpeg(file = "friend_count_meanvsage_with_months.jpeg")
library(gridExtra)
grid.arrange(p1, p2, ncol = 1)
str(pf.fc_by_age)
subset(pf.fc_by_age, age<71)
help('geom_smooth')
