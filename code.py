import json
import time
import urllib.request

apikey = 'q651HeEBw5DCSyfxDwPoD64U4OSeGkpy'

def searchCity():
	searchURL = 'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey='+apikey+'&q='+(input("Please enter the city name: ").replace(' ','%20'))
	#print(searchURL)
	with urllib.request.urlopen(searchURL) as searchJSON:
		data = json.loads(searchJSON.read().decode())
	#print(data)
	location_key = data[0]['Key']
	return location_key
def forecast():
	key = searchCity()
	forecastURL = 'http://dataservice.accuweather.com/forecasts/v1/daily/5day/'+str(key)+'?apikey='+apikey
	with urllib.request.urlopen(forecastURL) as forecastJSON:
		data = json.loads(forecastJSON.read().decode())
	return data
print(forecast())
