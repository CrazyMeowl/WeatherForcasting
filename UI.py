import mysql.connector

import PySimpleGUI as sg

import os

#Custom functions
def clearOutput():
	window.FindElement('_output_').Update('')


#Constants

#Filter buttons
ALL_FILTER_BUTTON = 'Filter all'
LOCATION_FILTER_BUTTON = 'Filter location Or Run Query'
WEATHER_FILTER_BUTTON = 'Filter weather'

#Query keys
LOCATION_QUERY_KEY = '_locationSQL_'
WEATHER_QUERY_KEY = '_weatherSQL_'



#Declaring the database
db = mysql.connector.connect(
	host = 'localhost',
	user = 'root',
	passwd = 'hehe',
	database = 'wherethefourcasting'
	)
cursor = db.cursor(buffered = True)


sg.theme('DarkBlue')    # Keep things interesting for your users

#All the things those are displayed on the UI
layout = [

	#Output
	[sg.Text('Output window')],
	[sg.Output(size=(150,30), key = '_output_')],

	#Location filters
	[sg.Text('Location query: '), sg.Input(key=LOCATION_QUERY_KEY, size = (130,1))],
	[sg.Text('Timezone: '), sg.Input(key='timezone_key', size=(5,1)),
	sg.Text('Region: '), sg.Input(key='region_key', size=(40,1)),
	sg.Text('Country: '), sg.Input(key='country_key', size=(40,1))],
	
	#Weather filters
	[sg.Text('Weather query: '), sg.Input(key=WEATHER_QUERY_KEY, size = (130,1))],
	
	#Executing buttons
	[sg.Button(LOCATION_FILTER_BUTTON), sg.Exit()]

	] 

#Create the window
window = sg.Window('Weather Forcasting', layout=layout, margins=(120, 30))      

while True:                             # The Event Loop    
	event, values = window.read()   

	#Read the input
	inputQuery = values[LOCATION_QUERY_KEY]

	#Location filter
	timezone = values['timezone_key']
	region = values['region_key']
	country = values['country_key']
	
	

	if event == sg.WIN_CLOSED or event == 'Exit':
		break      
	elif event == ALL_FILTER_BUTTON:
		print()

	elif event == LOCATION_FILTER_BUTTON:

		clearOutput()	#clear the output

		queryToExecute = "SELECT * FROM location"	#Initilise the query

		#Update the location query if there is any
		if (inputQuery != ''):
			queryToExecute = inputQuery

		#Update the location filters
		additionalQuery = "WHERE"

		filterCounter = 0
		#If there is a filter
		if (timezone != '' or region != '' or country != ''):

			if (timezone != ''):
				filterCounter = filterCounter +1
				if (filterCounter == 1): additionalQuery = additionalQuery + " timezone = " + timezone +""
				else: additionalQuery = additionalQuery + " AND timezone = " + timezone +""


			if (region != ''):
				filterCounter = filterCounter +1
				if (filterCounter == 1): additionalQuery = additionalQuery + " region = '" + region +"'"
				else: additionalQuery = additionalQuery + " AND region = '" + region +"'"

			if (country != ''):
				filterCounter = filterCounter +1
				if (filterCounter == 1): additionalQuery = additionalQuery + " country = '" + country +"'"
				else: additionalQuery = additionalQuery + " AND country = '" + country +"'"
		

		if (additionalQuery != "WHERE"):
			queryToExecute = queryToExecute + " " + additionalQuery


		#Select data from the table location, using the query
		cursor.execute(queryToExecute)


		#Output the locations
		for location in cursor:
			print(location)

window.close()




#Create the UI
#sg.Window(title="", layout=layout, margins=(480, 240)).read()

#example query
#SELECT name FROM location as L , wfd as W WHERE L.locationID = W.LocationID AND W.mintemp < 20
