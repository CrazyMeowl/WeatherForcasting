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


userID = input('\n0Enter userID: ')

while True:
	try:
		cursor.execute("SELECT user_pw FROM user_authen where userID = '"+ userID +"'")
		for _ in cursor:
			print(_[0])

	except Exception as bug:
		print(bug)