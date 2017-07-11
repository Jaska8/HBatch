#!/bin/sh
#title           :HBatch.sh
#description     :Batch video converter for HandBrakeCLI. Takes any video input.
#author		 :Jaska
#date            :20170711
#usage		 :bash HBatch.sh
#notes           :Requires HandBrakeCLI to be installed system wide or edit script for HandBrakeCLI full path

#Take user input
echo "Please type the input folder to be converted. Example /media/videos"
read SRC

echo "Please type output folder for converted videos Example /media/output"
read DST

echo "Please type output extension. mkv or mp4"
read EXT

echo "Please type in encoding settings. Leave empty for HandBrake defaults. List of settings https://handbrake.fr/docs/en/latest/cli/cli-guide.html"
read ENC_SETTINGS

#List all files inside source folder and remove the file extension for output
for file in "$SRC"/*
do
  filename=$(basename "$file" | cut -d. -f1)

#Check if output file exist
if [ -e "$DST/$filename.$EXT" ]
then
echo `date` "Video found. NOT ENCODING. PLEASE CHECK $DST/$filename file!" >> HBatch.log
else

#Start encoding
#Change to full path if you have installed HandBrake Manually.
HandBrakeCLI -i "$file" -o "$DST/$filename.$EXT" $ENC_SETTINGS

fi
done
