#!/bin/bash
#
# A simple script to show how to create a bootsplash.
# Do with it whatever you wish.
#
# This needs ImageMagick for the 'convert' and 'identify' tools.
#

#LOGO=logo.png
#LOGO_WIDTH=$(identify $LOGO | cut -d " " -f 3 | cut -d x -f 1)
#LOGO_HEIGHT=$(identify $LOGO | cut -d " " -f 3 | cut -d x -f 2)

THROBBER=logo.gif
#THROBBER_WIDTH=$(identify $THROBBER | head -1 | cut -d " " -f 3 | \
#						cut -d x -f 1)
#THROBBER_HEIGHT=$(identify $THROBBER | head -1 | cut -d " " -f 3 | \
#						 cut -d x -f 2)
THROBBER_WIDTH=200
THROBBER_HEIGHT=200

#convert -alpha remove \
#	-background "#000000" \
#	$LOGO \
#	logo.rgb

convert -alpha remove \
	-background "#000000" \
	$THROBBER \
	throbber%02d.rgb


#make clean
#make bootsplash-packer


# Let's put Tux in the center of an orange background.
./bootsplash-packer \
	--bg_red 0x00 \
	--bg_green 0x00 \
	--bg_blue 0x00 \
	--frame_ms 50 \
	--picture \
	--pic_width $THROBBER_WIDTH \
	--pic_height $THROBBER_HEIGHT \
	--pic_position 0 \
	--pic_anim_type 1 \
	--pic_anim_loop 0 \
	--blob throbber00.rgb \
	--blob throbber01.rgb \
	--blob throbber02.rgb \
	--blob throbber03.rgb \
	--blob throbber04.rgb \
	--blob throbber05.rgb \
	--blob throbber06.rgb \
	bootsplash-manjaro-glitch

rm *.rgb
