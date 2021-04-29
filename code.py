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
	(wfddate,mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,location_key) = ('2021-04-27',6,19,'Sunny','Null','Clear','Null',623)
	try:
		cursor.execute('INSERT INTO wfd VALUES (%s,%s,%s,%s,%s,%s,%s,%s)',(wfddate,mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,location_key))
	except:
		cursor.execute('UPDATE wfd SET mintemp = %s, maxtemp = %s, dayweather = %s, dayrain = %s, nightweather = %s, nightrain = %s WHERE locationID = %s AND wfddate = %s',(mintemp,maxtemp,dayweather,dayrain,nightweather,nightrain,location_key,wfddate))
	db.commit()

except Exception as bug:
	sg.PopupError(bug)
	print(bug)