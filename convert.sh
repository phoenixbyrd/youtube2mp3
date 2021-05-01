#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

INPUTTEXT=`yad --window-icon=./youtube2mp3.png --title="Youtube2MP3" --text-align=center --text="Convert a Youtube video to MP3" --entry --entry-label="Paste URL:" --entry-text=""` 

youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 $INPUTTEXT -o "~/Music/%(title)s.%(ext)s" || error

yad --window-icon=./youtube2mp3.png --title="" --text-align=center --text="MP3 Downloaded" --button=OK:0 --width=200