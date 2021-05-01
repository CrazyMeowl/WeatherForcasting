try:	
	import mysql.connector
	import PySimpleGUI as sg
	import os
	import datetime

	db = mysql.connector.connect(
		host = 'localhost',
		user = 'root',
		passwd = 'hehe',
		database = 'wherethefourcasting'
		)
	cursor = db.cursor() #buffered = True

	sg.theme('DarkAmber')
	layout = [
	[sg.Output(size=(150,6),key = '_output_')],
	[sg.Text('Enter city name here->'),sg.Input('Ho Chi Minh',key = 'LocationSearchBox')],
	[sg.Button('Forecast'), sg.Exit()]] 

	window = sg.Window('Weather Forcasting', layout=layout, margins=(10,10))

	def clearOutput():
		window.FindElement('_output_').Update('')


	while True:                             # The Event Loop    
		updateCount = 0
		insertCount = 0
		event, values = window.read()
		clearOutput()
		a = []
		if event == sg.WIN_CLOSED or event == 'Exit':
			break
		elif event  == 'Forecast':
			#print()
			query = "SELECT * FROM wfd WHERE locationID =  (SELECT locationID FROM location WHERE name = '" + values['LocationSearchBox'] + "' ) ORDER BY wfddate desc LIMIT 5"
			cursor.execute(query)
			a = cursor.fetchall()
			a.reverse()
			for _ in a :
				print('Date : %s, Min Temp: %s, Max Temp: %s, Day Weather: %s, Day Rain: %s, Night Weather: %s, Night Rain: %s'%(_[0],_[1],_[2],_[3],_[4],_[5],_[6]))
		
	window.close()

except Exception as bug:
	sg.PopupError(bug)