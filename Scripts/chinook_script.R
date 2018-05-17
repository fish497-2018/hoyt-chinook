library(tidyverse)
chinook_data <- read.csv("Data/OnHatcheryMortalityFigure.csv")
View(chinook_data)




#Create one bar graph for each brood year, where each histogram has one column per averaged density (low,medium,high)

ggplot(chinook_data) + 
  geom_bar(aes(x=Density, y=Percent.Mortality, color=Density)) +    
  facet_wrap(~Broodyear)


#this should work
ggplot(chinook_data, aes(Density, Percent.Mortality)) +
geom_bar(stat = "summary", fun.y = "mean") +
  facet_wrap(~Broodyear)




#code to group by density
group_by(chinook_data, Density) %>%
  summarize(Mortality = mean(Percent.Mortality)) 
