library(ggplot2)

#데이터
data <- c(15, 15, 16, 21, 25, 29, 30, 21, 32, 33, 
          46, 46, 49, 51, 52, 56, 60, 66, 66, 65)
pottery_df <- read.csv("/Users/jch/Desktop/Week5/Data/KIm_2009_Data.csv")
carbondate_df <- read.csv("/Users/jch/Desktop/Week5/Data/carbondate.csv")
countdata_df <- read.csv("/Users/jch/Desktop/Week5/Data/countdata.csv")
#줄기 잎 그림
stem(data,
     scale = 1)

stem(data,
     scale = 2)

#막대 그래프
ggplot(carbondate_df, aes(State)) +
  geom_bar(position = "identity") +
  labs(title = "지역별 방사성탄소연대측정치 수량",
       x = "지역",
       y = "수량") +
  theme(plot.title = element_text(hjust = 0.5))

#히스토그램
ggplot(pottery_df, aes(x=기고)) +
  geom_histogram(position = "identity", binwidth = 5) +
  labs(title = "송국리형토기 기고 히스토그램",
       x = "기고",
       y = "수량") +
  theme(plot.title = element_text(hjust = 0.5))

#원 그래프
ggplot(carbondate_df, aes(x="", fill=State)) +
  geom_bar(position = "fill") +
  coord_polar(theta = "y") +
  labs(title = "지역별 방사성탄소연대측정치 수량",
       x = "",
       y = "") + 
  theme(plot.title = element_text(hjust = 0.5))

#선 그래프
ggplot(countdata_df, aes(x=연도, y=유물수)) +
  geom_line(position = "identity") +
  labs(title = "A유적의 연도별 유물수 변화",
       x = "연도",
       y = "유물수") +
  theme(plot.title = element_text(hjust = 0.5))

#상자 그래프
ggplot(pottery_df, aes(y=기고)) +
  geom_boxplot() +
  labs(title = "송국리형토기 기고",
       y = "기고") +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(carbondate_df, aes(x=State, y=Age_BP)) +
  geom_boxplot() +
  labs(title = "지역별 탄소연대측정치",
       y = "BP") +
  theme(plot.title = element_text(hjust = 0.5))

#산점도
ggplot(pottery_df, aes(x=구경, y=기고)) +
  geom_point() +
  labs(title = "송국리형토기 구경 및 기고에 따른 분포",
       x = "구경",
       y = "기고") +
  theme(plot.title = element_text(hjust = 0.5))
