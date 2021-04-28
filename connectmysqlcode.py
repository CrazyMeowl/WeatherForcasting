try:
	import mysql.connector
	import json
	import time
	import urllib.request
	import PySimpleGUI as sg
	import os

	db = mysql.connector.connect(
		host = 'localhost',
		user = 'root',
		passwd = 'hehe',
		database = 'wherethefourcasting'
		)
	cursor = db.cursor(buffered=True)


	#cursor.execute('CREATE DATABASE wherethefourcasting') # query to create the data base
	#cursor.execute( 'CREATE TABLE Location (locationID int PRIMARY KEY NOT NULL, name VARCHAR(50), timezone int , region VARCHAR(50), country VARCHAR(50), longitude float, latitude float, elevation float)')
	#cursor.execute('CREATE TABLE Wfd ( wfddate DATE, mintemp int , maxtemp int, dayweather VARCHAR(30), dayrain VARCHAR(30), nightweather VARCHAR(30), nightrain VARCHAR(30), locationID int, FOREIGN KEY (locationID) REFERENCES location(locationID) )')
	#cursor.execute('CREATE TABLE Wfd ( wfddate DATE, mintemp int , maxtemp int, dayweather VARCHAR(30), dayrain VARCHAR(30), nightweather VARCHAR(30), nightrain VARCHAR(30), locationID int )')

	'''
	cursor.execute('DESCRIBE Person')

	for x in cursor:
		print(x)
	'''

	#cursor.execute('INSERT INTO Person(name,age) VALUES (%s,%s)',('cara',19))
	#db.commit()

	'''
	cursor.execute('SELECT * FROM Person')

	for x in cursor:
		print(x)
	'''

	#DATE YYYY-MM-DD


	apikey = 'X9pkAse76Fgcvlf89qQhod0J5mkl16Fc' #CrazyMeowl api
	#apikey = 'tgF9JGfFQW0YKArJUP1cZECMeg6iQmMj' #vvnt api
	def clearConsole():
		os.system("cls")
	def forecast(location_key):
		#GET FORECAST DATA
		forecastURL = 'http://dataservice.accuweather.com/forecasts/v1/daily/5day/'+str(location_key)+'?apikey='+apikey+'&details=false&metric=true'
		#&language=vi-vn
		with urllib.request.urlopen(forecastURL) as forecastJSON:
			dataforecast = json.loads(forecastJSON.read().decode())
		#print(dataforecast)
		#return dataforecast
		for i in dataforecast['DailyForecasts']:
			wfddate = (i['Date'].split("T"))[0]
			#print(i['Date'])
			#x = i['Date'].split('-')
			#yearX = x[0]
			#monthX = x[1]
			#dateX = x[2]
			#print(x)
			#print('Ngày {} tháng {} năm {}: '.format(dateX,monthX,yearX))
			#print(i['Temperature']["Minimum"]['Value'])
			mintemp = i['Temperature']["Minimum"]['Value']
			#print(i['Temperature']["Maximum"]['Value'])
			maxtemp = i['Temperature']["Maximum"]['Value']

			dayweather = i['Day']['IconPhrase']
			if (i['Day']['HasPrecipitation'] == True):
				dayrain = i['Day']['PrecipitationType']
			else:
				dayrain = 'Null'
			nightweather = i['Night']['IconPhrase']
			if (i['Night']['HasPrecipitation'] == True):
				nightrain = i['Night']['PrecipitationType']
			else:
				nightrain = 'Null'
			print(wfddate,mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,location_key)
			cursor.execute('INSERT INTO wfd(wfddate,mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,locationID) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)',(wfddate,mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,location_key))
			db.commit()

		#1 hour hourly patern
		#http://dataservice.accuweather.com/forecasts/v1/hourly/1hour/353981?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&metric=true
		#12 hour hourly
		#http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/353981?apikey=q651HeEBw5DCSyfxDwPoD64U4OSeGkpy&metric=true
	def searchCity(inLocation):	
		# Link that return key
		inLocation = inLocation.replace(' ','%20')
		searchURL = 'http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey='+apikey+'&q='+inLocation

		with urllib.request.urlopen(searchURL) as searchJSON:
			datalocation = json.loads(searchJSON.read().decode())
		try:
			location_key = datalocation[0]['Key'] #locationkey got returned
		except:
			return -1
		cursor.execute('SELECT locationID FROM location')
		for x in cursor:
			if str(x[0]) == str(location_key):
				#print('Location stored in database')
				return 0

		locationdetailurl = 'http://dataservice.accuweather.com/locations/v1/'+str(location_key)+'?apikey='+apikey

		with urllib.request.urlopen(locationdetailurl) as detailJSON:
			locationdetail = json.loads(detailJSON.read().decode())
			ld = locationdetail
			_ID = ld['Key']
			_name = ld['EnglishName']
			_timezone = ld['TimeZone']['GmtOffset']
			_region = ld['Region']['EnglishName']
			_country = ld['Country']['EnglishName']
			_latitude = ld['GeoPosition']['Latitude']
			_longitude = ld['GeoPosition']['Longitude']
			_elevation = ld['GeoPosition']['Elevation']['Metric']['Value']

		print('{ ID: ',_ID,'; Name: ',_name,'; Timezone: ',_timezone,'; Region: ',_region,'; Country: ',_country,'; Longitude: ',_longitude,'; Latitude: ',_latitude,'; Elevation: ',_elevation,'}')
		
		'''
		promt = input("Do you want to save the information to the database (Y/N): ")
		if 'y' in promt or 'Y' in promt:
			cursor.execute('INSERT INTO location(locationID,name,timezone,region,country,longitude,latitude,elevation) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)',(_ID,_name,_timezone,_region,_country,_longitude,_latitude,_elevation))
			db.commit()
		return 1
		'''
		__ = (_ID,_name,_timezone,_region,_country,_latitude,_longitude,_elevation)
		return __

	sg.theme('DarkAmber')    # Keep things interesting for your users

	layout = [[sg.Text('City Name'),sg.Input(key = 'LocationSearchBox')],
	[sg.Text(key = 'messagebox')],
	[sg.Output(size=(100,10))],
	#[sg.Input(key = 'in2')],
	[sg.Button('Search'),sg.Button('Add'),sg.Button('Forecast'),sg.Button('DeleteWFD'), sg.Exit()]] 

	window = sg.Window('Weather Forcasting', layout=layout, margins=(5, 5))


	while True:                             # The Event Loop    
		event, values = window.read()   
		if event == sg.WIN_CLOSED or event == 'Exit':
			break      
		elif event == 'Search':
			temp = values['LocationSearchBox']
			if len(temp) != 0:
				result = searchCity(temp)
				print(result)
			else:
				sg.Popup('Please Enter at the Search Box to search')
			#window['messagebox'].update('IF you want to add the city to the database click the "Add" button bellow')
			
			
		elif event == 'Add':
			if type(result) == tuple :
				(_ID,_name,_timezone,_region,_country,_longitude,_latitude,_elevation) = result
				cursor.execute('INSERT INTO location(locationID,name,timezone,region,country,longitude,latitude,elevation) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)',(_ID,_name,_timezone,_region,_country,_longitude,_latitude,_elevation))
				db.commit()
				result = 2
				sg.Popup('Added into the database')
			elif result == 2:
				sg.Popup('Dont add the same location again')
			else:
				pass
		elif event == 'Forecast':
			newlist = []
			cursor.execute('SELECT locationID FROM location')
			for x in cursor:
				newlist.append(x[0])
			print(newlist)
			for _ in newlist:
				forecast(_)
				#print(x[0])
			
			#forecast(623)
			sg.Popup('Done')
		elif event == 'DeleteWFD':
			cursor.execute('DELETE FROM wfd WHERE locationID > 0')
			db.commit()
			print('done')
	window.close()

except Exception as bug:
	sg.PopupError(bug)