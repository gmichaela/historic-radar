#!/bin/bash

while :
do 
	EXT=png
	TODAY=$(date +"%m-%d-%Y_%H")
	FILENAME="Radar.$TODAY.$EXT"

	echo $TODAY
	echo $FILENAME

	#curl http://images.intellicast.com/WxImages/RadarLoop/hfd_None_anim.gif > $FILENAME
	curl https://s.w-x.co/staticmaps/wu/wxtype/county_loc/hfd/animate.png > $FILENAME
	sleep 3600

	echo "Fell asleep for an hour there!"
done
echo "Done!"
