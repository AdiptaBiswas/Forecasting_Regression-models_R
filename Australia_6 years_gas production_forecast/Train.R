install.packages("fUnitRoots")
install.packages("forecast")
library("fUnitRoots")
library("forecast")
data<-as.data.frame(gas) # Just the show ther power of ts() function
data<-ts(data=data,start=c(1956,1),frequency=12) # ts() added to transform the df to ts type
plot(data)# The data shows both "Trend" and "Systematic change of Variance" but we want a continous data
adfTest(data)

# Building the model

mdl<-auto.arima(log10(data),approximation = TRUE,trace=TRUE)
summary(mdl)
pred<-predict(mdl,n.ahead=72)
pred<-10^(pred$pred)

# Plotting te forcasted values

forec_plt<-plot(forecast(mdl,h=72),col="violetred",main="Forecasting 6 years Oil Price")



