library(plotrix)

a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

mean(a) #평균
median(a) #중앙값
var(a) #분산
sd(a) #표준편차
quantile(a) #사분위수
summary(a) #기술통게량
plotrix::std.error(a)