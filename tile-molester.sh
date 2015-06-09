#!/bin/sh
if [ ! -d $HOME/.tile-molester ]; then
	mkdir -p $HOME/.tile-molester
fi
if [ ! -e $HOME/.tile-molester/settings.dtd ]; then
  cp /usr/share/tile-molester/settings.dtd $HOME/.tile-molester/
fi
if [ ! -e $HOME/.tile-molester/tmspec.dtd ]; then
  cp /usr/share/tile-molester/tmspec.dtd $HOME/.tile-molester/
fi
if [ ! -e $HOME/.tile-molester/tmspec.xml ]; then
  cp /usr/share/tile-molester/tmspec.xml $HOME/.tile-molester/
fi
cd $HOME/.tile-molester
exec java -jar /usr/share/java/tm.jar $@ 
