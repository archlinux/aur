#!/bin/bash

export HISTTIMEFORMAT='%d/%m/%y %T '
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTFILE=~/.bash_eternal_history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
