library(readr)
library(xts)
library(forecast)
library(tsutils)
library(tsbox)
library(TStools)
library(tsoutliers)
library(tseries)
library(Arima)
library(mase)

#Import data from Python
taxi_tips <- read_csv("C:/Users/drobe/Documents/TimeSeries/Final Project/taxi_trips_total_day.csv")

#Making it a XTS object
tsData <- xts(x=taxi_tips$Tips, order.by = taxi_tips$DateTime)

#7 days
plot(tsData[1:8])

#Here we can see that weekly theres a pretty solid trend
plot(tsData[1:32], main = 'Average Daily Tips for the month of January 2017', ylab = 'Average Daily Tips')


#Total Plot
plot(tsData, main = 'Average Daily Tips from Jan 2017 - December 2020', ylab = 'Average Daily Tips')

#Covid_time
covid_time <-tsData[index(tsData) >= "2020-01-01"]

#Total Plot
#Can very obviously see the tip decrease during Covid
plot(covid_time, main )

#Pre_Covid
Pre_covid_time <-tsData[index(tsData) <= "2020-02-14"]

#acf plot
acf(Pre_covid_time)

#Break out into training and test
train <-Pre_covid_time[index(Pre_covid_time) <= "2020-02-07"]
test <-Pre_covid_time[index(Pre_covid_time) > "2020-02-07"]

#Lets Try with our regular ARIMA Model
model <- auto.arima(train)

#Here we are forecasting out Seven days
forecast <- forecast(model, h = 7)

#Plot
plot(forecast)

#getting it so I can plot on the same one
test_2 <- ts(test, start = 1134, end = 1140, frequency =1)

#plot the forecast
plot(test_2,type="l",col="red", main = 'Test Data vs Forecast from 2/8/2020 - 2/14/2020', ylab = 'Average_Daily_Tips')
lines(forecast$mean,col="green")


#Check Residulas
checkresiduals(forecast)

#MASE is not bad - lets see if we can do better
#.7099069
accuracy(object = forecast,x = test)

########################################################

#Box Cox
Lambda<- BoxCox.lambda(train)

#Rerunning Model
model <- auto.arima(train, lambda = Lambda, D=1)

#Here we are forecasting out Seven days
forecast <- forecast(model, h = 7)

#MASE is not bad - lets see if we can do better
#MASE is now .711, goes down
accuracy(f = forecast,x = test)

#plot forecase
plot(forecast)

#Check residuals --> doesn't look great 
checkresiduals(forecast)


#Lets make it a ts 
nowTS <-ts_ts(Pre_covid_time)

#Split into test/train
nowTS_train <-ts_ts(train)
nowTS_test<- ts_ts(test)


#New plots
plot(diff(nowTS[1:365],7),type = "l")


#Checking for outliers. No Replacements made? No Outliers
tsoutliers(nowTS)

#lag ORder of 10
adf.test(nowTS)

#Differencing thetimeseries
new_residuals <-diff(diff(nowTS_train, 365), 7)

#Residuals after differencing by period of 7
plot(diff(nowTS, 7), main = 'Residuals after Differencing by a period of 7')
#Need to plot seasonal - so yearly AND weekly
plot(diff(diff(nowTS_train, 365), 7), main = 'Residuals after Differencing by a period of 7 and 365')



############################################################################
##Second Model
###########################################################################

#Double seasonality holt winters
dshw_model = dshw(nowTS_train, period1=7, period2 = 7*52, h=length(nowTS_test))

#forecasting forward 7 days
forecast = forecast(dshw_model, h=7)

#Check out residuals
checkresiduals(forecast)

#plot our forecast
autoplot(forecast)

#Check our residuals - these look way better
checkresiduals(forecast)


#getting it so I can plot on the same one
test_TS_2 <- ts(nowTS_test, start = 1, end = 7, frequency =1)
forecast_2 <- ts(forecast$mean, start = 1, end = 7, frequency =1)


#plot the forecast
plot(test_TS_2,type="l",col="red", main = 'Test Data vs Forecast from 2/8/2020 - 2/14/2020', ylab = 'Average_Daily_Tips')
lines(forecast_2,col="green")

