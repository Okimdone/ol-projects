#!/bin/bash

while true 
do
	adb  shell screencap /sdcard/screen.png && adb -s VWD7N17912005128 pull /sdcard/screen.png && ((eog "screen.png"  && sleep 0.50 )&)
	#killall eog
done
