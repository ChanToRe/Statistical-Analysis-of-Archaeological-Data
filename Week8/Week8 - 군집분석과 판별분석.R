library(cluster)
library(MASS)

data <- read.csv("/Users/jch/Desktop/고고학 자료 통계분석(강의)/Week8 - 군집분석과 판별분석/Data/ClusteringData.csv")
attach(iris)

#계층적 군집분석 - 유클리디안 거리 / 평균연결법
data_scale <- scale(data[,-1])
data_scale <- as.data.frame(scale(data_scale)) #단위가 다르기 때문에 표준화
eucl_dist <- dist(data_scale, method="euclidean") #유클리디안 거리 사용
ave_clust <- hclust(eucl_dist, method="average") #평균연결법 사용
plot(ave_clust)

#분할적 군집분석 - K-means
kmeans_clust <- kmeans(data_scale, 3) #k-means 군집분석 실행 / k=3
plot(data_scale[c("ResidentialSite_Num", "area_size")], col=kmeans_clust$cluster, pch=16)
points(kmeans_clust$centers[,c("ResidentialSite_Num", "area_size")], col=1:3, pch=8, cex=4)


#Iris dataset
iris <- data.frame(rbind(iris[,,1], iris[,,2], iris[,,3]))
train <- sample(1:150, 101) #데이터 1~150 중 101개 추출

#선형판별분석
lda_model <- lda(Species ~ ., data=iris,  subset = train)
plot(lda_model)
lda_model

#정분류율 계산
tt <- table(iris$Species[-train], predict(lda_model, iris[-train,])$class)
sum(tt[row(tt) == col(tt)])/sum(tt)
