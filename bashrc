# .bashrc
#chsh -s /bin/bash #make default

#trap ~/.bash_logout EXIT

#per disegnare vedi i comandi del pacchetto bashstyle-git

#
# .bashrc e .bash_profile (same) for blackarch
#
# colors
#darkgrey="$(tput bold ; tput setaf 0)"
#white="$(tput bold ; tput setaf 7)"
#red="$(tput bold; tput setaf 1)"
#nc="$(tput sgr0)"
#
## exports
#export PATH="${HOME}/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:"
#export PATH="${PATH}/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"
#export PS1="\[$darkgrey\][ \[$red\]\H \[$white\]\W\[$red\] \[$darkgrey\]]\\[$red\]# \[$nc\]"
#export LD_PRELOAD=""
#export EDITOR="vim"
#
## alias
#alias ls="ls --color"
#alias vi="vim"
#alias shred="shred -zf"
##alias python="python2"
#alias wget="wget -U 'noleak'"
#alias curl="curl --user-agent 'noleak'"
#
## source files
#[ -r /usr/share/bash-completion/completions ] &&
#  . /usr/share/bash-completion/completions/*
#


#!/bin/bash #assolutamente questa riga non deve essere all'inizio del .bashrc altrimenti
# occorre modificare .bash_profile da
# ~/.bashrc a
# . ~/.bashrc o source ~/.bashrc
# atrimenti al login root scrive
# "-BASH: /root/.bashrc: Access denied" o "-BASH: /root/.bashrc: Accesos negato"
# detta cazzata, lo fa lo stesso a questo punto e non capisco perché.
# fixato comunque metendo la seconda sintassi invece della prima dentro .bash_profile

[ ! -r /usr/bin/powerline-daemon ] &&
  echo "Please install powerline pkg with command 'yay -S powerline'"


[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

#_set_my_PS1() {
#    PS1='[\u@\h \W]\$ '
#    if [ "$(whoami)" = "liveuser" ] ; then
#        local iso_version="$(grep ^VERSION= /etc/os-release | cut -d '=' -f 2)"
#        if [ -n "$iso_version" ] ; then
#            local prefix="eos-"
#            local iso_info="$prefix$iso_version"
#            PS1="[\u@$iso_info \W]\$ "
#        fi
#    fi
#}
#_set_my_PS1
#unset -f _set_my_PS1
#
#alias ls='ls --color=auto'
#alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
#alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
#
#[[ "$(whoami)" = "root" ]] && return
#
#[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'
#
### Use the up and down arrow keys for finding a command in history
### (you can write some initial letters of the command first).
#bind '"\e[A":history-search-backward'
#bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.


#_GeneralCmdCheck() {
#    # A helper for functions UpdateArchPackages and UpdateAURPackages.
#
#    echo "$@" >&2
#    "$@" || {
#        echo "Error: '$*' failed." >&2
#        exit 1
#    }
#}
#
#_CheckInternetConnection() {
#    curl --silent --connect-timeout 8 https://8.8.8.8 >/dev/null
#    local result=$?
#    test $result -eq 0 || echo "No internet connection!" >&2
#    return $result
#}
#
#_CheckArchNews() {
#    local conf=/etc/eos-update-notifier.conf
#
#    if [ -z "$CheckArchNewsForYou" ] && [ -r $conf ] ; then
#        source $conf
#    fi
#
#    if [ "$CheckArchNewsForYou" = "yes" ] ; then
#        local news="$(yay -Pw)"
#        if [ -n "$news" ] ; then
#            echo "Arch news:" >&2
#            echo "$news" >&2
#            echo "" >&2
#            # read -p "Press ENTER to continue (or Ctrl-C to stop): "
#        else
#            echo "No Arch news." >&2
#        fi
#    fi
#}
#
#UpdateArchPackages() {
#    # Updates Arch packages.
#
#    _CheckInternetConnection || return 1
#
#    _CheckArchNews
#
#    #local updates="$(yay -Qu --repo)"
#    local updates="$(checkupdates)"
#    if [ -n "$updates" ] ; then
#        echo "Updates from upstream:" >&2
#        echo "$updates" | sed 's|^|    |' >&2
#        _GeneralCmdCheck sudo pacman -Syu "$@"
#        return 0
#    else
#        echo "No upstream updates." >&2
#        return 1
#    fi
#}
#
#UpdateAURPackages() {
#    # Updates AUR packages.
#
#    _CheckInternetConnection || return 1
#
#    local updates
#    if [ -x /usr/bin/yay ] ; then
#        updates="$(yay -Qua)"
#        if [ -n "$updates" ] ; then
#            echo "Updates from AUR:" >&2
#            echo "$updates" | sed 's|^|    |' >&2
#            _GeneralCmdCheck yay -Syua "$@"
#        else
#            echo "No AUR updates." >&2
#        fi
#    else
#        echo "Warning: /usr/bin/yay does not exist." >&2
#    fi
#}
#
#UpdateAllPackages() {
#    # Updates all packages in the system.
#    # Upstream (i.e. Arch) packages are updated first.
#    # If there are Arch updates, you should run
#    # this function a second time to update
#    # the AUR packages too.
#
#    UpdateArchPackages || UpdateAURPackages
#}
#
#
#_open_files_for_editing() {
#    # Open any given document file(s) for editing (or just viewing).
#    # Note1: Do not use for executable files!
#    # Note2: uses mime bindings, so you may need to use
#    #        e.g. a file manager to make some file bindings.
#
#    local progs="xdg-open exo-open"     # One of these programs is used.
#    local prog
#    for prog in $progs ; do
#        if [ -x /usr/bin/$xx ] ; then
#            $prog "$@" >& /dev/null &
#            return
#        fi
#    done
#    echo "Sorry, none of programs [$progs] is found." >&2
#    echo "Tip: install one of packages" >&2
#    for prog in $progs ; do
#        echo "    $(pacman -Qqo "$prog")" >&2
#    done
#}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
################################################################################





# ----------------------------------------------------------------------------------------------------------
# Definizione tipo terminale avvio
# ----------------------------------------------------------------------------------------------------------

#[[ $- == *i* ]] && echo 'Interactive' || echo 'not-interactive'
[[ $- != *i* ]] && return

#shopt -q login_shell && echo 'login' || echo 'not-login'

# Source global definitions
#if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
#[[ -f /etc/bashrc ]] && . /etc/bashrc

#if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


# ===================================================================================================
# ===================================================================================================
#simonarc carica la variabile TTY_REAL e qundi va carica PRIMA di usarla
[[ -r ~/.simonarc ]] && source ~/.simonarc
#[[ -r ~/.simonarc ]] && . ~/.simonarc
#if [[ -r ~/.simonarc ]]; then
#  source ~/.simonarc
#fi
# ===================================================================================================
# ===================================================================================================


# -------------------------------------------------------------------------------------------
# keyfunction
# -------------------------------------------------------------------------------------------
#bind '"\e[24~":"foobar"'
#You may also need stty -ixon in your ~/.bashrc to disable flow control and make ^S and ^Q available.
#The ^[ is the output representation. The \e is one way to enter it (^[ doesn't work for that).
#bind -X to list keys programmed
case $TERM in
  linux )
    #echo "Linux/console term found"
    #You can find the string to put into bindkey by typing ctrl-v and then your desired keystroke (in zsh)
    bind -x '"\e[[A":"get-help"' # da terminale console [F1] #ok
    bind -x '"\e[[B":"get-sys-info"' # da terminale console [F2] #ok
    bind '"\e[[B":"clear"' # da terminale console [F3]
    #bind '"\e[[D":"^qget-help\n"' # da terminale console [F4]
    bind '"\e[[E":"update\n"' # da terminale console [F5]
    #bind '"\e[17~":"^qget-help\n"' # da terminale console [F6]
    #bind '"\e[18~":"^qget-help\n"' # da terminale console [F7]
    #bind '"\e[19~":"^qget-help\n"' # da terminale console [F8]
    #bind '"\e[20~":"^qget-help\n"' # da terminale console [F9]
    #bind '"\e[21~":"^qget-help\n"' # da terminale console [F10]
    #bind '"\e[23~":"^qget-help\n"' # da terminale console [F11]
    #bind '"\e[24~":"^qget-help\n"' # da terminale console [F12]
    ;;
  xterm* )
    #echo "Xterm found"
    #You can find the string to put into bindkey by typing ctrl-v and then your desired keystroke (in zsh).
    bind -x '"\eOP":"get-help"' # da terminale Xterm (Predefinito XFree 4) [F1]
    bind -x '"\eOQ":"get-sys-info"' # da terminale Xterm (Predefinito XFree 4) [F2]
    bind '"\eOR":"clear"' # da terminale Xterm (Predefinito XFree 4) [F3]
    #bind '"\eOS":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F4]
    bind '"\e[15~":"update\n"' # da terminale Xterm (Predefinito XFree 4) [F5]
    #bind '"\e[17~":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F6]
    #bind '"\e[18~":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F7]
    #bind '"\e[19~":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F8]
    #bind '"\e[20~":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F9]
    #bind '"\e[21~":"^qget-help\n"' # da terminale Xterm (Predefinito XFree 4) [F10]
    #F11 usato dal terminale
    #F12 usato dal sistema

    ;;
  * )
esac


# -----------------------------------------------------------------------------------------------------------------
# Setup prompt PS1
# -----------------------------------------------------------------------------------------------------------------

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    #local pwdmaxlen=25
    local pwdmaxlen=40
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white

    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"

    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

    #local UC=$W                 # user's color
    local UC=$Y                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color

    #PS1="$TITLEBAR ${EMK}[${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}]${UC}\\$ ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
    PS1="$TITLEBAR ${C}[${UC}\u${C}@${G}\h ${EMR}\${NEW_PWD}${C}]${UC}\\$ ${NONE}"
}

#formato prompt
#ok altrernativa 1
prompt1() {
  PROMPT_COMMAND=bash_prompt_command
  bash_prompt
  unset bash_prompt
}

#colori e formato terminale prompt
# https://bbs.archlinux.org/viewtopic.php?pid=1068202#p1068202
prompt3() {
  PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
}

#Prompt di KitchM
prompt4() {
  PS1='\e[1;33;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;34m[dir.= \w] \# > \e[0;0m'
}

prompt5() {
  PS1="\n\[\e[30;1m\]\[\016\]l\[\017\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n\[\016\]m\[\017\]-(\[\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"
}

#default
#This creates a simple prompt which displays:
#[bdjnk@PowerMAP icons]$
#prompt6() {
#  PS1='[u@h W]$ '
#}
#prompt6


#PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( `sed -n "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[38;5;22m/"$((`sed -n "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"' \
#PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

#Say,  you want to display a green :) if the previous command succeeded, and a red :( if it failed. The $? variable holds the return value of the previous program — it contains a 0 if it succeeded, and a non-zero value if it failed. You could do something like:
#PS1='$(if [[ $? == 0 ]]; then echo "\[\e[32m\]:)"; else echo "\[\e[31m\]:("; fi)\[\e[0m\] \u \w $ '

#if [ "$TERM" != "linux" ]; then source ~/cmd/pureline/pureline ~/cmd/pureline/pureline.conf;  fi
#new-prompt () { /bin/bash -noprofile -norc -c 'source ~/cmd/pureline/pureline ~/cmd/pureline/pureline.conf '; }




#simona 2018-08-14 start
#ok altrernativa 2
prompt2() { #powerline
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
}

#ok
#This is the PS1 used to create the slightly steam-punk looking Bash prompt, using box-drawing characters:
prompt10() {
  c="\[\033["
  p="${c}0;37m\]"
  PS1="\n${p}╔ǁ ${c}1;3\$(if [ \$? -eq 0 ]; then echo '2'; else echo '1'; fi)m\]*$p ǁ ${c}36m\]\@ \d$p ǁ ${c}35m\]\j$p ǁ ${c}30m\]\u${c}33m\]@\h$p ǁ ${c}1;34m\]\w$p ǁ ${c}32m\]\$(/bin/ls -1 | /usr/bin/wc -l) files, \$(/bin/ls -lah | /usr/bin/grep -m 1 total | /bin/sed 's/total //')${c}m\]$p ǁ═╗\n╚═${c}1;3\$(if [ ${EUID} -eq 0 ]; then echo '1'; else echo '4'; fi)m\]»${c}m\] "
}

#ok
#And this is the PS1 used to create the more compact and somber looking Bash prompt:
prompt11() {
  c="\[\033["
  n="${c}m\]"
  PS1="\n${c}1;3\$(if [ \$? -eq 0 ]; then echo '2'; else echo '1'; fi);40m\]*$n ${c}36;40m\]\@ \d$n ${c}35;40m\]\j$n ${c}37;40m\]\u${c}33m\]@\h$n ${c}1;34;40m\]\w$n ${c}32;40m\]\$(/bin/ls -1 | /usr/bin/wc -l) files, \$(/bin/ls -lah | /usr/bin/grep -m 1 total | /bin/sed 's/total //')${c}m\]\n${c}1;3\$(if [ ${EUID} -eq 0 ]; then echo '1'; else echo '4'; fi);47m\]>$n "
}

#simple colored color with ssh release
prompt12() {
  if [ "$1" = "color" ]; then
    PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    [ -n "$SSH_TTY" ] && PS1='\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
    PS1='\u@\h:\w\$ '
  fi
}

#blackarch default
prompt13() {
  darkgrey="$(tput bold ; tput setaf 0)"
  white="$(tput bold ; tput setaf 7)"
  red="$(tput bold; tput setaf 1)"
  nc="$(tput sgr0)"
  PS1="\[$darkgrey\][ \[$red\]\H \[$white\]\W\[$red\] \[$darkgrey\]]\\[$red\]# \[$nc\]"
}

#simonarc carica variabile TTY_REAL e qundi va carica PRIMA di usarla
#default:
#prompt1
#prompt2
#[[ ! -n "$TTY_REAL" ]] && prompt1 || prompt12 color
#[[ ! -n "$TTY_REAL" ]] && prompt2 || prompt12 color

#  [ -r "/usr/bin/powerline-daemon" ] &&
#  [ -r "/usr/share/powerline/bindings/bash/powerline.sh" ] &&

(tty | grep -q "/dev/tty") && TTY_REAL="Yes" || unset TTY_REAL #ok
if [[ -r "/usr/bin/powerline-daemon" && -r "/usr/share/powerline/bindings/bash/powerline.sh" ]] ; then
  [[ ! -n "$TTY_REAL" ]] && prompt2 || prompt13
else
  prompt13
fi

#ok ,ma problemio con il "set -u"
#[[ ! -n "$TTY_REAL" ]] && prompt2 || prompt13
#prompt3

#prompt root come su caricato da /etc/bash.bashrc

# -------------------------------------------------------------------------------------------------------------
# Impostazione funzine ambiente shell bash
# -------------------------------------------------------------------------------------------------------------

#shopt NO zsh

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting when exiting.  #139609
#shopt -s histappend

# Try to keep environment pollution down, EPA loves us.
#unset use_color sh

# -P  If set, do not follow symbolic links when performing commands. The physical directory is used instead. -o physical
set -P

#Di base la storia dei comandi nella console viene salvata solamente quando si digita 'exit' nella console. Quando si chiude la Konsole con il bottone 'x' nell'angolo ciò non acccade. Per abilitare il salvataggio automatico dopo ogni esecuzione di comandi
shopt -s histappend
if [[ "${PROMPT_COMMAND}" ]] ;then
  PROMPT_COMMAND="$PROMPT_COMMAND
  history -a"
else
  PROMPT_COMMAND="history -a"
fi

#if [[ -r ~/.aliasrc ]]; then
#  . ~/.aliasrc
#fi

# -------------------------------------------------------------------------------------------------------------
# Alias comandi standard classici
# -------------------------------------------------------------------------------------------------------------

#alias kate='nohup & >/dev/null 2>&1' #bash
#alias kate='kate & dosown' #bash
alias kate='brun kate'

#alias ls='ls --color=auto'

# vi has a bug: use vim instead vi to avoid that arrow keys display A, B, C, D in insert mode
#alias vi='vim'
#anche in .simonarc

#x comando direnv
eval "$(direnv hook bash)"

# -------------------------------------------------------------------------------------------------------------
# End
# -------------------------------------------------------------------------------------------------------------

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*

[ -r /usr/share/doc/find-the-command/ftc.bash ] &&
  source /usr/share/doc/find-the-command/ftc.bash

#echo "<<bash>>"

#non cancellare per nessun motivo
export $(dbus-launch)


# ---------------------------------------------------------------------------------------------------------------
# Test e prove
# ---------------------------------------------------------------------------------------------------------------


#if command -v tmux>/dev/null; then # check if tmux command exists
#    if [[ "$(tty)" =~ /dev/tty ]] && [[ ! "$TERM" =~ screen ]] && [ -z "$TMUX" ]; then
#        # We're on a TTY and *not* in tmux
#        exec tmux -u
#    fi
#fi

#if [ $(tty) == "/dev/tty1" ]; then
#    while true; do startx -- -nocursor -depth 16; echo "Again [$?]..."; done
#fi


[[ -r /home/simona/.config/broot/launcher/bash/br ]] && source /home/simona/.config/broot/launcher/bash/br

