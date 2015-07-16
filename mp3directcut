#!/bin/bash

export WINEDEBUG=-all # Supresses Wine debug messages

if [ ! -d "$HOME"/.mp3directcut ] ; then
   mkdir "$HOME"/.mp3directcut
   #prepare the environment here
   
   ln -s /usr/share/mp3directcut/mp3DirectCut.exe "$HOME"/.mp3directcut/mp3DirectCut.exe
   ln -s -T /usr/share/mp3directcut/Languages "$HOME"/.mp3directcut/Languages
   
fi

wine "$HOME"/.mp3directcut/mp3DirectCut.exe "$@"
