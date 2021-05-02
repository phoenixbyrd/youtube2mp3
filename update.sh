#!/bin/bash

git pull origin main

sudo cp youtube2mp3.sh /opt/youtube2mp3/
sudo cp convert.sh /opt/youtube2mp3/
sudo cp youtube2mp3.png /opt/youtube2mp3/
cp Youtube2MP3.desktop ~/.local/share/applications

sudo chown pi:pi /opt/youtube2mp3/
sudo chown pi:pi /opt/youtube2mp3/youtube2mp3.sh
sudo chown pi:pi /opt/youtube2mp3/convert.sh
sudo chown pi:pi /opt/youtube2mp3/youtube2mp3.png

sudo chmod +x /opt/youtube2mp3/youtube2mp3.sh
sudo chmod +x /opt/youtube2mp3/convert.sh

yad --window-icon=./youtube2mp3.png --title="" --text-align=center --text="Youtube2MP3 Updated!" --button=OK:0 --width=200