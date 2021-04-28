import PySimpleGUI as sg
import time

sg.theme('DarkAmber')    # Keep things interesting for your users

layout = [[sg.Output(size=(60,10))],
          [sg.Button('Go'), sg.Button('Nothing'), sg.Button('Exit')]  ]

window = sg.Window('Window Title', layout)

while True:             # Event Loop
    event, values = window.read()
    if event == sg.WIN_CLOSED or event == 'Exit':
        break
    if event == 'Go':
        print('About to go to call my long function')
        
        print('Your long operation completed')
window.close()