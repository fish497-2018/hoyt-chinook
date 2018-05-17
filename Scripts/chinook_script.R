library(dplyr)
chinook_data <- read.csv("Data/OnHatcheryMortalityFigure.csv")
View(chinook_data)




#Create one bar graph for each brood year, where each histogram has one column per averaged density (low,medium,high)
library(tidyverse)


View(chinook_data)

ggplot(chinook_data) + 
  geom_bar(aes(x=Density, y=Percent.Mortality, color=Density)) +    
  facet_wrap(~Broodyear)

library(tidyverse)
ggplot(chinook_data) + 
  geom_bar(aes(x=Density, y=Percent.Mortality)) 
  
ggplot(chinook_data) + 
  geom_point(aes(x=Density, y=Percent.Mortality)) +
  facet_wrap(~Broodyear) 


 

  

#this should work
ggplot(chinook_data, aes(Density, Percent.Mortality)) +
geom_bar(stat = "identity") +
  facet_wrap(~Broodyear) 
  




#code to group by density
group_by(chinook_data, Density) %>%
  summarize(Mortality = mean(Percent.Mortality))
