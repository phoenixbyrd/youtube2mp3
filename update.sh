#!/bin/bash

git pull origin main

cp Youtube2MP3.desktop ~/.local/share/applications

yad --window-icon=./youtube2mp3.png --title="" --text-align=center --text="Youtube2MP3 Updated!" --button=OK:0 --width=200