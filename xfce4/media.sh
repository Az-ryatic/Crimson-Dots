#!/usr/bin/env bash

exclude=("Playback" "bell" "AudioStream")

i=-1
excluded=0
while true; do
	current=`pactl list sink-inputs | grep -E "Sink Input|media.name" | grep -oP 'Sink Input #\K\d+' | sort -nr | head $i | tail -1`
	output=`pactl list sink-inputs | grep -A 50 'Sink Input #'$current | grep media.name | sed 's/.*\\"\\(.*\\)\\"/\\1/' | sed 's/ - YouTube$//' | sed 's/ - mpv$//'`
	for item in "${exclude[@]}"; do
		if [ "$output" == "$item" ]; then
			excluded=1
		fi
	done
	if [ $excluded = 1 ]; then
		((i = i - 1))
	else
		break
	fi
	excluded=0
done

if [ -n "${output// }" ]; then
	output=$(echo "$output" | xargs)
	if [ "$output" == "ALSA Playback" ]; then
		dbus=`busctl --user list | grep 'org.mpris.MediaPlayer2.spotify' | grep -o 'org\.mpris\.MediaPlayer2\.[^ ]*'`
		metadata=`dbus-send --print-reply --dest=$dbus /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:org.mpris.MediaPlayer2.Player string:Metadata`
		artist=`echo "$metadata" | grep -A 2 artist | grep -A 2 variant | grep string | sed 's/.*string "\(.*\)"/\1/'`
		title=`echo "$metadata" | grep -A 1 title | grep variant | sed 's/.*string "\(.*\)"/\1/'`
		output="$artist - $title"
	fi
	if [ ${#output} -gt 75 ]; then
		output=${output:0:75}...
	fi
	echo Now Playing: $output
else
	echo ...?
fi

