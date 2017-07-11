#/bin/bash
#title           :HBatchstatic.sh
#description     :Batch video converter for HandBrakeCLI.
#author		 :Jaska
#date            :20170711
#usage		 :bash HBatchstatic.sh or ./HBatchstatic.sh
#notes           :Requires HandBrakeCLI to be installed system wide or edit script for HandBrakeCLI full path


#Video input folder
SRC="/path/to/video/folder"

#Video output folder
DST="/path/to/output/folder"

#File extension mp4 or mkv
EXT=mkv

#List of settings leave empty for HandBrake defaults (not recommended) https://handbrake.fr/docs/en/latest/cli/cli-guide.html
ENC_SETTINGS=

for file in "$SRC"/*
do
  filename=$(basename "$file" | cut -d. -f1)

if [ -e "$DST/$filename.$EXT" ]
then
echo `date` "Video found. NOT ENCODING. PLEASE CHECK $DST/$filename file!" >> HBatch.log
else

HandBrakeCLI -i "$file" -o "$DST/$filename.$EXT" $ENC_SETTINGS

fi
done
