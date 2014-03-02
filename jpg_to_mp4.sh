# Sort pictures from GOPRO09* in img (symbolic links)
# TODO: Make all file and directory calls dynamic.

x=1;for i in G*.JPG; do counter=$(printf %06d $x); ln "$i" img_in_order/img"$counter".jpg; x=$(($x+1)); done
 
# Rotate pictures if needed
#for file in *.jpg; do convert $file -rotate 180 rotated-$file; done
 
# Make a 24img/s movie
ffmpeg -i "img_in_order/img%06d.jpg" -r 24 -s hd720 -vcodec libx264 -crf 18 -threads 8 NAME.mp4

