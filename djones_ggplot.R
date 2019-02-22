#install.packages("ggplot2")
library(ggplot2)
res <- dbSendQuery(wrds,"SELECT * FROM DJONES.DJDAILY")
data3 <- dbFetch(res,n=-1)
dbClearResult(res)
xx <- as.Date(data3$date, "%Y-%m-%d")
yy <- data3$dji
zz <- data3$djt
data2 <- data3[which(data3$date>"1980-01-01"),]
ggplot(data2) + geom_point(aes(x=data2$date,y=data2$dji),color="steelblue") + geom_point(aes(x=data2$date,y=data2$djt),color="red")
qplot(xx,yy,xlab="Date",ylab="DJI",color='red',geom=c("point"))
