import json
import time
import urllib.request

apikey = 'q651HeEBw5DCSyfxDwPoD64U4OSeGkpy'
	
def forecast():

	while True:
	
		searchURL = 'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey='+apikey+'&q='+(input("Please enter the city name: ").replace(' ','%20'))
		with urllib.request.urlopen(searchURL) as searchJSON:
			datalocation = json.loads(searchJSON.read().decode())
	
		location_key = datalocation[0]['Key']
		#print(datalocation)
		#GET LOCATION detail DATA 
		locationdetailurl = 'http://dataservice.accuweather.com/locations/v1/'+str(location_key)+'?apikey='+apikey
		with urllib.request.urlopen(locationdetailurl) as detailJSON:
			locationdetail = json.loads(detailJSON.read().decode())
		#GET FORECAST DATA
		forecastURL = 'http://dataservice.accuweather.com/forecasts/v1/daily/5day/'+str(location_key)+'?apikey='+apikey+'&details=false&metric=true'
		#forecastURL = 'http://dataservice.accuweather.com/forecasts/v1/daily/5day/'+str(location_key)+'?apikey='+apikey+'&language=vi-vn&details=false&metric=true'
		#http://dataservice.accuweather.com/forecasts/v1/daily/5day/353981?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&language=vi-vn&details=false&metric=true
		with urllib.request.urlopen(forecastURL) as forecastJSON:
			dataforecast = json.loads(forecastJSON.read().decode())
		#print(dataforecast)
		return dataforecast,datalocation,locationdetail
		
		#1 hour hourly patern
		#http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/353981?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&metric=true
		#12 hour hourly
		#http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/353981?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&metric=true
dataforecast,datalocation,a = forecast()
print(datalocation)
locationX = datalocation[0]['AdministrativeArea']['LocalizedName']
print(locationX)
for i in dataforecast['DailyForecasts']:

	i['Date'] = (i['Date'].split("T"))[0] #change the format YYYY-MM-DDT07:00:00+07:00 to YYYY-MM-DD
	#print(i['Date'])
	x = i['Date'].split('-')
	yearX = x[0]
	monthX = x[1]
	dateX = x[2]
	#print(x)
	print('Ngày {} tháng {} năm {}: '.format(dateX,monthX,yearX))
	print(i['Temperature']["Minimum"]['Value'])
	print(i['Temperature']["Maximum"]['Value'])
	for j in i:
		if j == 'Day' or j == 'Night': #print day and night weather
			print(j)
			print(i[j]['IconPhrase'])
			if(i[j]['HasPrecipitation'] == True): #If này phải giữ ( Có mưa hay không )
				print(i[j]['PrecipitationType'])
			else:
				print('Null')
input()


