date=`date +%F`
x=1;for i in G*.JPG; do counter=$(printf %06d $x); ln "$i" img_in_order/img"$counter".jpg; x=$(($x+1)); done
 
# Rotate pictures if needed
#for file in *.jpg; do convert $file -rotate 180 rotated-$file; done
 
ffmpeg -i "img_in_order/img%06d.jpg" -r 24 -s hd720 -vcodec libx264 -crf 18 -threads 8 $1_$date_$2.mp4

