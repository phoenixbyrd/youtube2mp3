#!/bin/bash

# fifo
export YAD_NOTIF=$(mktemp -u --tmpdir YAD_NOTIF.XXXXXX)
mkfifo "$YAD_NOTIF"

# trap that removes fifo
trap "rm -f $YAD_NOTIF" EXIT


function set_notification_quit() {
  echo "menu:Update!bash -c './update.sh'!download|Quit!quit!gtk-quit"
}

exec 3<> $YAD_NOTIF

yad --notification --image=./youtube2mp3.png --text "Convert a Youtube video to MP3" --command "./convert.sh" --listen <&3 & notifpid=$!

# waits until the notification icon is ready
until xdotool getwindowname $(xdotool search --pid "$notifpid" | tail -1) &>/dev/null; do
        # sleep until the window opens
        sleep 0.5       
done

set_notification_quit >&3

# Waits for notification to exit
wait $notifpid

exec 3>&-

exit 0