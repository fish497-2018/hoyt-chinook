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


# Convert Density column to a factor - using the factor() function.
# Since factors are ordered alphabetically (e.g. High, Low, Med in this data), we need to reorder
# by explicitly listing them in alpahabetical order.
chinook_data$Density <- factor(chinook_data$Density, levels = c('Low', 'Med', 'High'))

# Create box plot of data with overlay of individual data points.

ggplot(data = chinook_data, 
       aes(x = as.character(Broodyear), y = Percent.Mortality)) + # Converts Broodyear values to character (instead of integer)
  geom_boxplot(alpha = 0) + # Create box plot & set box plot box transparency to 100% transparent.
  geom_jitter(alpha = 0.5, color = "blue") + # Create dot plot & set data point transparency to 50% transparent.
  facet_wrap(~ Density) + # Create mutl-faceted plot, grouped by Density.
  labs(title = "Percent Mortality per Year
       by Density",
       x = "Broodyear",
       y = "Percent Mortality") # Set labels for title and axes.