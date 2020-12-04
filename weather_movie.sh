#!/bin/bash

        SECONDSCRUNCH=0
while :
do 
	EXT=gif
	TODAY=$(date +"%m-%d-%Y_%H")
	THIS_MONTH=$(date +"%m")
	FILENAME="Radar.$TODAY.$EXT"
        MONTHFILE="$THIS_MONTH.$EXT"
        FASTMONTHFILE="RadarFast.$THIS_MONTH.$EXT"


	echo $TODAY
	echo $FILENAME

	curl http://images.intellicast.com/WxImages/RadarLoop/hfd_None_anim.gif > $FILENAME
	SLEEPTIME=$((3600 - $SECONDSCRUNCH))
        echo $SLEEPTIME
        sleep $SLEEPTIME 

        echo "time check 1"      
        echo $(date +"%m-%d-%Y_%H_%M_%S") 
        MINSTART=$(date +"%M") 
        echo "making monthdir, moving radar to it, converting all files from month to monthfile, converting monthfile to speedy one, removing the slow one"
        echo "making movie dir, moving the file to movie subdir, running ffmpeg" 
        mkdir $THIS_MONTH 
        mv $FILENAME $THIS_MONTH 
        cd $THIS_MONTH 
        convert Radar*.gif[0-3] -scene 0 $MONTHFILE
        convert -delay 5x100 $MONTHFILE $FASTMONTHFILE
       
        echo "converting fastmonthfile into thismonth.mp4" 
        rm $MONTHFILE
        mkdir movie
        mv $THIS_MONTH.mp4 movie
        ffmpeg -i $FASTMONTHFILE $THIS_MONTH.mp4&
        cd ..

	echo "Fell asleep for an hour there!"
        echo "time check 2"
        echo $(date +"%m-%d-%Y_%H_%M_%S")
        MINEND=$(date +"%M")
        MINTOTAL=$(($MINEND - $MINSTART))
        SECONDSCRUNCH=$(($MINTOTAL * 60))
        echo "Seconds to take away next time"
        echo $SECONDSCRUNCH
	let COUNT=$COUNT+1
done
echo "Done!"
