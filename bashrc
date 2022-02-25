# bashrc --- Bash startup file -*- mode: sh; sh-shell: bash; -*-

# Don't do anything if current shell is not running interactively.
case $- in
    *i* ) ;;
    *)    return;;
esac

# Check the window size after each command and update the values of
# LINES and COLUMNS if necessary.
if [ ! -z $DISPLAY ]; then
    shopt -s checkwinsize
fi

PS1='[\u@\h \W]\$ '

# Flush Bash history after each command.
PROMPT_COMMAND='history -a'

# Activate system-wide completion if it is exists.
if [ -r /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

# Change commands history file to under XDG_CACHE_HOME.
case :$SHELLOPTS: in
    *:posix:*) HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/sh/sh_history;;
    *)         HISTFILE=${XDG_CACHE_HOME:-$HOME/.cache}/bash/bash_history;;
esac
