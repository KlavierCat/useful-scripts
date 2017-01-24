#!/bin/bash
# This script downloads and saves files with an incremental number in the file names from the {baseUrl} every ${interval} seconds.
# eg. download and save http://sample-url/song-01.ogg, http://<a-sample-url>/song-02.ogg, etc. every min. till it finishes downloading and saving http://sample-url/song-10.ogg.
# to run this script, make the necessary changes to the variables etc, make this file executable, then type: sh ./download.sh

interval=60        # how often should the download be executed, in seconds
counter=1          # the smallest number
maxNum=10          # the largest number
fileExt='ogg'      # the file extension, without the dot at the beginnig
baseUrl="http://sample-url/song-" # the base URL from where you will download the files

counterStr=''      # this is a var for me to change number like '01' into '10' in my file name

while [ $counter -le $maxNum ]; do
  if [ $counter -le 9 ]; then
    counterStr="0${counter}"
  else
    counterStr="${counter}"
  fi

  echo "getting file: ${counterStr}.${fileExt}"
  curl -O "${baseUrl}${counterStr}.${fileExt}"
  ((counter++))

  if [ $counter -le $maxNum ]; then
    sleep ${interval}
  fi
done
