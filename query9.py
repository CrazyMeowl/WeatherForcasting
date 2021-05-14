import mysql.connector
import PySimpleGUI as sg
import os


db = mysql.connector.connect(
	host = 'localhost',
	user = 'root',
	passwd = 'hehe',
	database = 'wherethefourcasting'
	)
cursor = db.cursor()

while True:
	try:
		cursor.execute('SELECT userID FROM user_authen')
		for _ in cursor:
			print(_[0])

		userID = input('\nEnter userID: ')

		#cursor.execute("insert into test value(CONCAT_WS('',(SELECT LEFT((SELECT username FROM user_authen WHERE userID = '%s'),5)),(SELECT LEFT((SELECT name FROM location AS L WHERE L.locationID = (select locationID FROM  user_authen where userID = '%s')),3)),(SELECT RIGHT((SELECT phone FROM user_phones AS P, user_authen AS A WHERE P.userID = '%s' LIMIT 1),3))))"%(userID,userID,userID))
		cursor.execute("SELECT CONCAT_WS('',(SELECT LEFT((SELECT username FROM user_authen WHERE userID = '%s'),5)),(SELECT LEFT((SELECT name FROM location AS L WHERE L.locationID = (select locationID FROM  user_authen where userID = '%s')),3)),(SELECT RIGHT((SELECT phone FROM user_phones AS P, user_authen AS A WHERE P.userID = '%s' LIMIT 1),3))) AS SHIT"%(userID,userID,userID) )
		for _ in cursor:
			print(_[0])
	except Exception as bug:
		print(bug)