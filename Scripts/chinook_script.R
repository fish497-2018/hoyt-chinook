library(dplyr)
chinook_data <- read.csv("Data/OnHatcheryMortalityFigure.csv")
View(chinook_data)




#Create one bar graph for each brood year, where each histogram has one column per averaged density (low,medium,high)
library(tidyverse)
ggplot(chinook_data) + 
  geom_bar(aes(x=Density, y=Percent.Mortality, color=Density)) +    
  facet_wrap(~Broodyear)

library(tidyverse)
ggplot(chinook_data) + 
  geom_bar(aes(x=Density, y=Percent.Mortality)) 
  
ggplot(chinook_data) + 
  geom_point(aes(x=Density, y=Percent.Mortality)) +
  facet_wrap(~Broodyear) 


 

  



