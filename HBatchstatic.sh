#!/bin/sh
#title           :HBatchstatic.sh
#description     :Batch video converter for HandBrakeCLI.
#author		 :Jaska
#date            :20170711
#usage		 :bash HBatchstatic.sh or ./HBatchstatic.sh
#notes           :Requires HandBrakeCLI to be installed system wide or edit script for HandBrakeCLI full path


#Video input folder
SRC="/home/user/videos"

#Video output folder
DST="/home/user/encoded"

#File extension mp4 or mkv
EXT=

#List of settings leave empty for HandBrake defaults (not recommended) https://handbrake.fr/docs/en/latest/cli/cli-guide.html
ENC_SETTINGS=""
#KEEP SETTINGS BETWEEN ""! otherwise -e and -E will be ignored.
for file in "$SRC"/*.*
do
  filename=$(basename "$file")

if [ -e "$DST/""${filename%.*}"".$EXT" ]
then
echo `date` "Video found. NOT ENCODING. PLEASE CHECK $DST/"${filename%.*}" file!" >> HBatch.log
else
HandBrakeCLI -i "$file" -o "$DST/""${filename%.*}"".$EXT" $ENC_SETTINGS

fi
done
