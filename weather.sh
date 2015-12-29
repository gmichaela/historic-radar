#!/bin/bash

while :
do 
	EXT=gif
	TODAY=$(date +"%m-%d-%Y_%H")
	FILENAME="Radar.$TODAY.$EXT"

	echo $TODAY
	echo $FILENAME

	curl http://images.intellicast.com/WxImages/RadarLoop/hfd_None_anim.gif > $FILENAME
	sleep 3600

	echo "Fell asleep for an hour there!"
done
echo "Done!"
