#!/bin/sh

echo $$ > "/home/paulloz/.config/wallpaper/pid"

shopt -s nullglob

cd /media/data/pictures/Wallpapers

while true; do
    files=()
    for i in *.jpg *.png; do
	[[ -f $i ]] && files+=("$i")
    done
    range=${#files[@]}

    ((range)) && feh --bg-fill "${files[RANDOM % range]}"

    sleep 5m
done
