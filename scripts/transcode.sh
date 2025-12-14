#!/bin/bash
# Place in Video's or change incrontab reference
# /home/eseidel/Videos/orig       IN_CLOSE_WRITE  /home/eseidel/Videos/transcode.sh $@ $#

INFILE="$1/$2"
OUTFILE="/home/eseidel/Videos/transcoded/$2.mov"

/usr/bin/ffmpeg -i "$INFILE" \
  -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p \
  -c:a alac "$OUTFILE"

