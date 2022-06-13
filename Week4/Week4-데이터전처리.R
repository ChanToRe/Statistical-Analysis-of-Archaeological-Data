library(dplyr)

#데이터 불러오기, 요약
df <- read.csv("/Users/jch/Documents/github/Statistical-Analysis-of-Archaeological-Data/Week4/Data/kim_2009_data.csv")
head(df)

#행과열 추출
bigmouth <- df %>%
  dplyr::filter(구경>=10)
head(bigmouth)

gigo <- df %>%
  dplyr::select("기고")
head(gigo)

#정렬
sort <- df %>%
  dplyr::arrange(기고)
head(sort)
descsort <- df %>%
  dplyr::arrange(desc(기고))
head(descsort)

#데이터 결합
##열 분할
A <- df %>%
  dplyr::select("번호", "구경", "목지름", "견부각")
B <- df %>%
  dplyr::select("번호", "기고", "실용량", "복원용량", "용량잔차")
##열 결합
C1 <- dplyr::full_join(A, B, by="번호")
head(C1)
C2 <- dplyr::left_join(B, A, by="번호")
head(C2)
C3 <- dplyr::inner_join(A, B)
head(C3)
C4 <- dplyr::bind_cols(A, B)
head(C4) #bind는 그대로 붙이는 것이기 때문에 "번호"가 2개가됨

##행 분할
D <- df %>%
  dplyr::filter(기고>10)
E <- df %>%
  dplyr::filter(기고<=10)
##행 결합
F1 <- dplyr::bind_rows(D, E)
head(F1)
F2 <- dplyr::bind_rows(D, E, .id="df-id")
head(F2)

#결측치 처리
NA_row <- read.csv("/Users/jch/Documents/github/Statistical-Analysis-of-Archaeological-Data/Week4/Data/NA_data.csv")
NA_df <- dplyr::bind_rows(df, NA_row) #의도적으로 결측치 삽입
mean(NA_df$기고) #결측치 때문에 NA산출

is.na(NA_df) #결측치 확인
sum(is.na(NA_df)) #결측치 갯수 확인

#제거
mean(NA_df$기고, na.rm = TRUE) #결측치 제거
omit_NA <- na.omit(NA_df) #하나라도 결측치가 있는 행 제거
mean(omit_NA$기고) #결측치가 제거되어 정상적으로 평균산출

#대체
NA_df$기고 <- ifelse(!is.na(NA_df$기고), NA_df$기고, round(mean(NA_df$기고, na.rm=T), 2))
tail(NA_df)
