#!/usr/bin/env bash

if [ ! -d "$HOME"/.moo ] ; then
    mkdir -p "$HOME"/.moo
    ln -s /usr/share/moo/* "$HOME"/.moo
fi

dosbox -c "@echo off" -c "mount c $HOME/.moo/" -c "c:" -c "cls" -c "echo Starting Master of Orion..." -c "orion" -c "exit"
