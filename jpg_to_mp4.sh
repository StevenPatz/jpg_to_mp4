#!/bin/bash
date=`date +%F`
if [ "$#" -lt "1" ]
  then echo
    echo "Please provide a name for the file"
    echo
  else 
    x=1;
    for i in G*.JPG
      do counter=$(printf %06d $x)
        ln "$i" img_in_order/img"$counter".jpg
        x=$(($x+1))
      done
ffmpeg -i "img_in_order/img%06d.jpg" -r 24 -s hd720 -vcodec libx264 -crf 18 -threads 8 $date_$1.mp4
fi
