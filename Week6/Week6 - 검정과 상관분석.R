library(ggplot2)
library(extrafont)

#data
df <- read.csv("/Users/jch/Desktop/Week6/Data/SiteArea.csv")
chidf <- read.csv("/Users/jch/Desktop/Week6/Data/Chi_squared_Test.csv")
songgukdf <- read.csv("/Users/jch/Desktop/Week6/Data/KIm_2009_Data.csv")

#data 분할
df_A <- subset.data.frame(df, df$Site=="A")
df_B <- subset.data.frame(df, df$Site=="B")
summary(df_A)
summary(df_B)

#t-test
t.test(Area ~ Site, df)#두 표본의 분산이 다를 때
t.test(Area ~ Site, var.equal=TRUE,df)#두 표본의 분산이 같을 때

#chi-squared test
table(chidf$Sex, chidf$RorL)
chisq.test(chidf$Sex, chidf$RorL)

#median polish
med.d <- medpolish(table(chidf$Sex, chidf$RorL))
print(med.d)

#Correlation Analysis
ggplot(songgukdf, aes(x=기고, y=실용량)) +
  geom_point()
cor.test(songgukdf$기고, songgukdf$실용량, method = "pearson")
cor.test(songgukdf$기고, songgukdf$실용량, method = "spearman")
cor.test(songgukdf$기고, songgukdf$실용량, method = "kendall")
