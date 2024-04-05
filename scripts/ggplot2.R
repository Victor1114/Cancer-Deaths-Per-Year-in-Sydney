library(ggplot2)

set.seed(302)  
data <- data.frame(
  Year = rep(2004:2023, times=5),
  Deaths = rnorm(100, mean=1000, sd=200),
  CancerType = rep(c("Lung", "Breast", "Prostate", "Colorectal", "Other"), each=20)
)

ggplot(data, aes(x=Year, y=Deaths, group=CancerType, color=CancerType)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title="Cancer Deaths in Sydney Hospitals (2004 - 2023)",
       x="Year",
       y="Number of Deaths") +
  theme(legend.title=element_blank())

