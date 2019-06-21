library(ggplot2)
library(tidyr)
library(dplyr)
df <- economics %>%
  select(date, psavert, uempmed) %>%
  gather(key = "variable", value = "value", -date)

ggplot(df, aes(x = date, y = value)) + 
  geom_line(aes(color = variable), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800"))


#https://cran.rstudio.com/web/packages/ggfortify/vignettes/plot_pca.html
library(ggfortify)
df <- iris[c(1, 2, 3, 4)]

iris2 <- iris
iris2$Species <-
ifelse(iris2$Species == "setosa","1",ifelse(iris2$Species == "versicolor","2","3"))
colnames(iris2)[5] <- "Cluster"
autoplot(prcomp(df), data = iris2, colour = 'Cluster')