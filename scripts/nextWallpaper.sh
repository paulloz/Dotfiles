#!/bin/sh

ppid=$(cat "/home/paulloz/.config/wallpaper/pid")
process=$(ps --ppid $ppid | grep "sleep")
set -- $process
pid=$1
kill $pid
