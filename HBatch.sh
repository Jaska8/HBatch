#!/bin/sh
#title           :HBatch.sh
#description     :Batch video converter for HandBrakeCLI. Takes any video input.
#author		 :Jaska
#date            :20170711
#usage		 :bash HBatch.sh
#notes           :Requires HandBrakeCLI to be installed system wide or edit script for HandBrakeCLI full path

echo "Please type the input folder to be converted. Example /home/user/videos"
read SRC

echo "Please type output folder for converted videos Example /home/user/output"
read DST

echo "Please type output extension. mkv or mp4"
read EXT

echo "Please type in encoding settings. Leave empty for HandBrake defaults. List of settings https://handbrake.fr/docs/en/latest/cli/cli-guide.html"
read ENC_SETTINGS

for file in "$SRC"/*
do
  filename=$(basename "$file")

if [ -e "$DST/""${filename%.*}"".$EXT" ]
then
echo `date` "Video found. NOT ENCODING. PLEASE CHECK $DST/"${filename%.*}" file!" >> HBatch.log
else
HandBrakeCLI -i "$file" -o "$DST/""${filename%.*}"".$EXT" $ENC_SETTINGS
fi
done
