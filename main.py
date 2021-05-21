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
	[sg.Output(size=(130,6),key = '_output_')],
	[sg.Text('UserID'),sg.Input('',key = 'UserID'),sg.Text('UserPW'),sg.Input('',key = 'UserPW')],
	[sg.Text('Enter city name here->'),sg.Input('Ho Chi Minh',key = 'LocationSearchBox')],
	[sg.Button('Forecast'),sg.Button('Check'), sg.Exit()]] 

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
		elif event == 'Forecast':

			Searchtime = str(datetime.datetime.now())[0:10]
			userID = values['UserID']
			user_pw = values['UserPW']
			if "'" in user_pw:
				sg.PopupError("Password dont contain special character ")
			elif len(userID) == 0 or len(user_pw) == 0:
				sg.PopupError("Please dont leave blank at UserID or UserPassword")
			else:
			
				cursor.execute("SELECT COUNT(username) FROM user_authen WHERE userID = '"+userID+"' AND user_pw = '"+user_pw+"'")
				for _ in cursor:
					if _[0] == 1:
						cursor.execute("SELECT COUNT(locationID) FROM location WHERE name = '" + values['LocationSearchBox'] + "'")
						for _ in cursor:
							if _[0] == 1:
								query = "SELECT locationID FROM location WHERE name = '" + values['LocationSearchBox'] + "'"
								cursor.execute(query)
								a = cursor.fetchall()
								for _ in a:
									locationID = str(_[0])
								
								query = "SELECT * FROM wfd WHERE locationID = "+ locationID +" ORDER BY wfddate desc LIMIT 5"
								cursor.execute(query)
								a = cursor.fetchall()
								a.reverse()
								for _ in a :
									print('Date : %s, Min Temp: %s, Max Temp: %s, Day Weather: %s, Day Rain: %s, Night Weather: %s, Night Rain: %s'%(_[0],_[1],_[2],_[3],_[4],_[5],_[6]))
								##print(Searchtime)
								cursor.execute("INSERT INTO user_activities(userID,search_date,search_location) VALUES ('%s','%s',%s)"%(userID,Searchtime,locationID))
								db.commit()
							else:
								sg.PopupError("Can't find city in database!")
					else:
						sg.PopupError('Wrong username or password')


			
			

			#print(UserID)
			#print(UserPW)
		
			
	window.close()

except Exception as bug:
	sg.PopupError(bug)