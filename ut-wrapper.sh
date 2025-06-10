#!/bin/sh

if [ ! -f $HOME/.utpg/System/UnrealTournament.ini ]; then
    mkdir -p $HOME/.utpg/System/
    if [ -f /opt/ut/System64/UnrealTournament.ini ]; then
        cp /opt/ut/System64/UnrealTournament.ini $HOME/.utpg/System/UnrealTournament.ini
    else
        cp /opt/ut/System/UnrealTournament.ini $HOME/.utpg/System/UnrealTournament.ini
    fi
fi

if [ ! -f $HOME/.utpg/System/User.ini ]; then
    mkdir -p $HOME/.utpg/System/
    if [ -f /opt/ut/System64/User.ini ]; then
        cp /opt/ut/System64/User.ini $HOME/.utpg/System/User.ini
    else
        cp /opt/ut/System/User.ini $HOME/.utpg/System/User.ini
    fi
fi

#if [ -z $WAYLAND_DISPLAY ]; then
    if [ -f /opt/ut/System64/ut-bin ]; then
        /opt/ut/System64/ut-bin
    else
        /opt/ut/System/ut-bin
    fi
#else
#    if [ -f /opt/ut/System64/ut-bin ]; then
#        SDL_VIDEODRIVER=wayland /opt/ut/System64/ut-bin
#    else
#        SDL_VIDEODRIVER=wayland /opt/ut/System/ut-bin
#    fi
#fi

