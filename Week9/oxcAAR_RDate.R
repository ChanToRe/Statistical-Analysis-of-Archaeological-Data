library(ggplot2)
library(oxcAAR)

quickSetupOxcal()

Rdatetest <- oxcalCalibrate(1940,25,"Test1")
Rdatetest
plot(Rdatetest)
