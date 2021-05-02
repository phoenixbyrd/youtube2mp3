#!/bin/bash

if [ $(dpkg-query -W -f='${Status}' yad 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt install yad -y;
fi

if [ $(dpkg-query -W -f='${Status}' youtube-dl 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt install youtube-dl -y;
fi

sudo mkdir /opt/youtube2mp3
sudo cp youtube2mp3.sh /opt/youtube2mp3/
sudo cp convert.sh /opt/youtube2mp3/
sudo cp youtube2mp3.png /opt/youtube2mp3/
sudo cp update.sh /opt/youtube2mp3
cp Youtube2MP3.desktop ~/.local/share/applications

sudo chown pi:pi /opt/youtube2mp3/
sudo chown pi:pi /opt/youtube2mp3/youtube2mp3.sh
sudo chown pi:pi /opt/youtube2mp3/convert.sh
sudo chown pi:pi /opt/youtube2mp3/youtube2mp3.png
sudo chown pi:pi /opt/youtube2mp3/update.sh

sudo chmod +x /opt/youtube2mp3/youtube2mp3.sh
sudo chmod +x /opt/youtube2mp3/convert.sh
sudo chmod +x /opt/youtube2mp3/update.sh

cp -r .git/ /opt/youtube2mp3

yad --window-icon=/opt/youtube2mp3/youtube2mp3.png --title="" --text-align=center --text="Youtube2MP3 Installed" --button=OK:0 --width=200