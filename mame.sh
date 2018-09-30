#!/bin/sh

# create a variable equal to '$HOME' (literal) that will be used later in the ini creation
home='$HOME'

if [ "$1" != '' ] && [ "$1" = '--newini' ] 
then
    printf '%s\n' "Rebuilding the ini file at ${HOME}/.mame/mame.ini"
    printf '%s\n' 'Modify this file for permanent changes to your MAME'
    printf '%s\n' 'options and paths before running MAME again.'
    
    cd "${HOME}/.mame"
    if [ -e mame.ini ]
    then
        printf '%s\n' 'Your old ini file has been renamed to mameini.bak'
        mv -f mame.ini mameini.bak
    fi
    /usr/lib/mame/mame \
        -artpath            "${home}/.mame/artwork;artwork" \
        -ctrlrpath          "${home}/.mame/ctrlr;ctrlr" \
        -inipath            "${home}/.mame/ini" \
        -rompath            "${home}/.mame/roms" \
        -samplepath         "${home}/.mame/samples" \
        -cfg_directory      "${home}/.mame/cfg" \
        -comment_directory  "${home}/.mame/comments" \
        -diff_directory     "${home}/.mame/diff" \
        -input_directory    "${home}/.mame/inp" \
        -nvram_directory    "${home}/.mame/nvram" \
        -snapshot_directory "${home}/.mame/snap" \
        -state_directory    "${home}/.mame/sta" \
        -video opengl \
        -createconfig
        
elif [ ! -e "${HOME}/.mame" ] 
then
    printf '%s\n' 'Running MAME for the first time...'
    printf '%s\n' "Creating an ini file for MAME at ${HOME}/.mame/mame.ini"
    printf '%s\n' 'Modify this file for permanent changes to your MAME'
    printf '%s\n' 'options and paths before running MAME again.'
    
    mkdir "${HOME}/.mame"
    mkdir "$HOME"/.mame/{artwork,cfg,comments,ctrlr,diff,ini,inp,nvram,samples,snap,sta,roms}
    
    cd "${HOME}/.mame"
    /usr/lib/mame/mame \
        -artpath            "${home}/.mame/artwork;artwork" \
        -ctrlrpath          "${home}/.mame/ctrlr;ctrlr" \
        -inipath            "${home}/.mame/ini" \
        -rompath            "${home}/.mame/roms" \
        -samplepath         "${home}/.mame/samples" \
        -cfg_directory      "${home}/.mame/cfg" \
        -comment_directory  "${home}/.mame/comments" \
        -diff_directory     "${home}/.mame/diff" \
        -input_directory    "${home}/.mame/inp" \
        -nvram_directory    "${home}/.mame/nvram" \
        -snapshot_directory "${home}/.mame/snap" \
        -state_directory    "${home}/.mame/sta" \
        -video opengl \
        -createconfig
else
    /usr/lib/mame/mame "$@"
fi
