### 실습 전에 먼저 설치해주세요
# install.packages("httr")
# install.packages("devtools")

library(devtools)
library(httr)

# install_github("vqv/ggbiplot")

library(ggbiplot)
attach(iris)

# Data processing
df <- iris
df <- iris[, -5]
df_category <- iris[, 5]

prcomp_df <- prcomp(df, center = T, scale. = T)

# Summary
summary(prcomp_df)

# Plot
pca_iris <- ggbiplot(prcomp_df, choices = c(1, 2), obs.scale = 1, 
                     var.scale = 1, groups = df_category) + 
  scale_color_discrete(name = '') +
  theme(legend.direction = 'horizontal', legend.position = 'top')

print(pca_iris)
