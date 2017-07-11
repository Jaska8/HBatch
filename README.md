# HBatch & HBatchstatic
Simple batch bash script for HandBrakeCLI. Takes input folder and encodes to output folder keeping filenames, works with empty spaces on directory path/filename.

You need to have HandBrakeCLI installed. Works only on linux based machines.

Script is safe as it will not overwrite any existing files (Script creates HBatch.log file for later inspection) and all input files will be left untouched!

# HBatch
Usage: ./HBatch.sh or bash HBatch.sh

Script will ask for input and output folder. Do not end the path with forward slash as this is part of the script.

All encoding settings can be found here https://handbrake.fr/docs/en/latest/cli/cli-guide.html you do not need to set -i or -o as this is done by the script

Only built-in subtitles work so far and external subtitles are not possible to be added atm (probably).

There is no pause or cancel command built in as the script will go trough all video files inside input the folder.

If output video file gets corrupted or encoding process is stopped before finish just delete the video file and run the script again.


# HBatchstatic

Usage ./HBatchstatic.sh or bash HBatchstatic.sh EDIT THE SCRIPT SETTINGS FIRST!

Edit the script for settings you desire instead of inputting them. 
