# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#.simona-prompt-powerline-zsh-zshrc  ???????????????????????????????????????????????????????

#.zshrc
#chsh -s /bin/zsh #make default

#. /usr/local_host/etc/bashrc
#if [[ -o login ]]; then
#   # Note: Start bash NOT as a login shell!!!
#   bash
#   exit
#else
#   exec bash
#fi

# -------------------------------------------------------------------------------------------------------------------
#check required packages
# -------------------------------------------------------------------------------------------------------------------

[ ! -r /usr/bin/powerline-daemon ] &&
  echo "Please install powerline pkg with command 'yay -S powerline'"
[ ! -r /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ] &&
  echo "Please install powerlevel10k pkg with command 'yay -S zsh-theme-powerlevel10k-git'"
[ ! -d /usr/share/oh-my-zsh ] &&
  echo "Please install oh-my-zsh pkg with command 'yay -S oh-my-zsh-git'"

# ----------------------------------------------------------------------------------------------
# Impostazioni standard comuni
# ----------------------------------------------------------------------------------------------

autoload -Uz promptinit
promptinit

autoload -U compinit
compinit
zstyle ':completion:*' menu select
#zstyle ':completion::complete:*' gain-privileges 1
# case insensitive completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
#     'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
setopt COMPLETE_ALIASES

#ZLE has an emacs mode and a vi mode. If one of the $VISUAL or $EDITOR environment variables contain the string vi then vi mode will be used; otherwise, it will default to emacs mode. Set the mode explicitly with bindkey -e or bindkey -v respectively for emacs mode or vi mode.
#bindkey -e #emacs
bindkey -v #vi (risolve problema uso tasti cursore in insert mode)


autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

#[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
#[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

#Resetting the terminal with escape sequences
autoload -Uz add-zsh-hook
function reset_broken_terminal () {
	printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}
add-zsh-hook -Uz precmd reset_broken_terminal


alias reload=". ~/.zshrc && echo 'Your zshrc file has been reloaded'"

#autoload -Uz run-help
#unalias run-help
#alias help=run-help
#
#autoload -Uz run-help-git
#autoload -Uz run-help-ip
#autoload -Uz run-help-openssl
#autoload -Uz run-help-p4
#autoload -Uz run-help-sudo
#autoload -Uz run-help-svk
#autoload -Uz run-help-svn

#PROBLEMA: non funziona
#Typically, compinit will not automatically find new executables in the $PATH. For example, after you install a new package, the files in /usr/bin/ would not be immediately or automatically included in the completion. Thus, to have these new executables included, one would run:
#$ rehash
#This 'rehash' can be set to happen automatically.[3] Simply include the following in your zshrc:
zstyle ':completion:*' rehash true

#Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

#provato su konsole: cambia titolo terminale
#print -n '\e]30;My xterm title\a'

#suffix file alias
#alias -s sh=kate
#alias -s ksh=kate
#alias -s txt=kate

#In case that the program does not provide any similar option, it is possible to trick the program into thinking its stdout is an interactive terminal with the following utilities: stdoutisatty, unbuffer or:
zmodload zsh/zpty
pty() {
	zpty pty-${UID} ${1+$@}
	if [[ ! -t 1 ]];then
		setopt local_traps
		trap '' INT
	fi
	zpty -r pty-${UID}
	zpty -d pty-${UID}
}
ptyless() {
	pty $@ | less
}
#Usage:
#$ ptyless program
#To pipe it to other pager (less in this example):
#$ pty program | less

#simona 07/09/2020
#By default, Ctrl+d will not close your shell if the command line is filled, this fixes it:
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

#simona 07/09/2020: "On-demand rehash" su https://wiki.archlinux.org/index.php/Zsh#On-demand_rehash
#see also /etc/pacman.d/hooks/zsh.hook
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

if [[ -r $HOME/.dynamic-colors/completions/dynamic-colors.zsh ]] ; then
  #https://github.com/sos4nt/dynamic-colors
  export PATH="$HOME/.dynamic-colors/bin:$PATH"
  source $HOME/.dynamic-colors/completions/dynamic-colors.zsh
fi



# -------------------------------------------------------------------------------------------------------------------
# default
# -------------------------------------------------------------------------------------------------------------------

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="yyyy-mm-dd"

setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

#CD_ABLE_VARS
#EXTENDED_GLOB

#CORRECT
setopt correct_all # autocorrect commands
#alias mkdir='nocorrect mkdir'
#setopt correctall

#This will add a 10 second wait before you can confirm a wildcard deletion. Lots of people, myself included, are so used to confirming the removal of files, that we don’t stop to actually read what will be deleted. Better to have it now then add it after you make a mistake!
setopt RM_STAR_WAIT

#setopt nobeep

#HISTFILE=$HOME/.zsh_history
export HISTSIZE=32768;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

#export TERM='xterm-256color' #questa forzatura maschera le carte ma non serve a niente e casino sotto console

#[[ $UID = 0 ]] && ZSH_DISABLE_COMPFIX=true #???
ZSH_DISABLE_COMPFIX=true
#fix link /root/.oh-my

alias su='su --shell=/bin/zsh'


# ------------------------------------------------------------------------------------------------------
# Personalizzazioni
# ------------------------------------------------------------------------------------------------------

#Fish provides a very powerful shell syntax highlighting. To use this in zsh, you can install zsh-syntax-highlighting from offical repository and add following to your zshrc:
[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#source /usr/share/zsh/plugins/zsh-dircolors-solarized/zsh-dircolors-solarized.plugin.zsh

#Optimized and extended zsh-syntax-highlighting
#source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#>> You can also append 'su' option to use su instead of sudo
#>> for root access, 'noprompt' to disable installation
#>> prompt at all, or 'quiet' to decrease verbosity, e.g.:
#source /usr/share/doc/find-the-command/ftc.zsh noprompt quiet
#>> It is necessary to create pacman files database, run
## pacman -Fy
#>> You may also want to enable timer for regular
#>> pacman files database update:
## systemctl enable pacman-files.timer
#see https://github.com/agura-lex/find-the-command
[ -r /usr/share/doc/find-the-command/ftc.zsh ] &&
  source /usr/share/doc/find-the-command/ftc.zsh

# -------------------------------------------------------------------------------------------------------------------
#oh-my-zsh
# -------------------------------------------------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
#export ZSH=$HOME/.oh-my-zsh
export ZSH=/usr/share/oh-my-zsh

[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
  source $ZSH/oh-my-zsh.sh

#Il tema è solo e soltanto la definizione del prompt

#ZSH_THEME="powerlevel10k/powerlevel10k"
#no theme enabled
ZSH_THEME=""

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
#ZSH_THEME="risto"
#ZSH_THEME="agnoster-simona"
#ZSH_THEME="agnoster"
#ZSH_THEME="3den"
#ZSH_THEME="muse"

#ZSH_THEME="powerlevel9k/powerlevel9k"

#ZSH_THEME="random"

#disisntallato pacchetto grml-zsh-config

#AGNOSTER_PROMPT_ORDER=(
#  user          # Username section
#  dir           # Current directory section
#  host          # Hostname section
#  git           # Git section (git_branch + git_status)
  #hg            # Mercurial section (hg_branch  + hg_status)
  #exec_time     # Execution time
#)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview
#https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins=(
  #productivity
  #autoenv #automatically execs script on changing dir (.env file)
  colored-man-pages #adds colors to manpages
  colorize #cat with syntax highlight support
  #command-not-found #suggests package name with relevant command
  common-aliases #common aliases
  copydir #copies current dir full path to clipboard
  copyfile #copies selected file content to clipboard
  cp #cp with progress bar (rsync)
  history #aliases: h for history, hsi for grepping history
  encode64
  extract
  fbterm
  #kate #Kate text editor alias http://kate-editor.org/
  #pass #pass utility autocompletion
  rsync #aliases
  screen #GNU screen enhances (titles etc)
  #ssh-agent #ssh-agent start script
  tmux #enhanced Tmux support
  web-search #Adds several commands to do web search. Commands bing google yahoo duckduckgo
  #jumping
  jump #allows to mark dirs and jump to marks
  #build
  #perl #aliases for Perl
  #python
  #python #python aliases (pyfind, pyclean, pygrep)
  #distro
  #archlinux #aliases for yaourt and pacman
  systemd #systemd aliases plugin; Add sc-[command] aliases to all systemctl commands, using sudo when needed.
  #misc
  #themes #ZSH theme switcher
  #emoji-clock #fancy shell clocks

  #zdharma/fast-syntax-highlighting
  #syntax-highlighting
  zsh-autosuggestions
  history-substring-search #funzioan chiamato da qua?
  dotenv # dotenv: test and warn of incorrect.env syntax
  sudo #ESC twice: Puts sudo in front of the current command, or the last one if the command line is empty.
  #iwhois # provides iwhois command to use CNAMES under whois.geek.nz to find mos…
  #vi-mode #Increase zsh vi-like functionality #non usare fa casino con il tasto canc e altri scorrendo history
  #zsh-fast-syntax-highlighting-git
  #zsh-plugiman realpathn-wd-git
  #command-not-found
  z

  #alias-tips
  #find-the-command
  #zsh-dircolors-solarized

  #caricamento da qua non funziona? necessario source sotto
  #zshmarks #cd ~/.oh-my-zsh/custom/plugins ; git clone https://github.com/jocelynmallon/zshmarks.git
)

#zshmarks
#You can change the location of the bookmarks file (default is $HOME/.bookmarks) by adding the environment variable 'BOOKMARKS_FILE' to your shell profile.
#export BOOKMARKS_FILE="foo/bar"
# showmarks bookmark
[ -r $ZSH/custom/plugins/zshmarks/zshmarks.plugin.zsh ] &&
  source $ZSH/custom/plugins/zshmarks/zshmarks.plugin.zsh
#alias g="jump"
#alias s="bookmark"
#alias d="deletemark"
#alias p="showmarks"
#alias l="showmarks"

eval "$(direnv hook zsh)"

# ===================================================================================================
# ===================================================================================================
#simonarc carica va variabile TTY_REAL e qundi va carica PRIMA di usarla
if [[ -r ~/.simonarc ]]; then
  source ~/.simonarc #. ~/.simonarc #equivalente
fi
# ===================================================================================================
# ===================================================================================================


# -------------------------------------------------------------------------------------------
# silent background
# -------------------------------------------------------------------------------------------

#alias kate='nohup & >/dev/null 2>&1' #bash funzioano??
#alias kate='kate & dosown' #bash funzioano??

# Run the command given by "$@" in the background
silent_background_zsh() {
  setopt local_options no_notify no_monitor
  #"$@" &
  #disown &>/dev/null # Close STD{OUT,ERR} to prevent whine if job has already completed
  #see alias update=
  # We'd use &| to background and disown, but incompatible with bash, so:
  ( "$@" &
  disown ) &>/dev/null 2>&1 # Close STD{OUT,ERR} to prevent whine if job has already completed
}

# Use ls-colors for path completions
#function _set-list-colors() {
#	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#	unfunction _set-list-colors
#}
#sched 0 _set-list-colors  # deferred since LC_COLORS might not be available yet


alias kate='silent_background_zsh kate'
alias dolphin='silent_background_zsh dolphin'
#grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
#alias -s {yml,yaml}=vim
#alias -g G='| grep -i'

#With these options set, you don't need to type cd to change directories. Just type the directory name, and zsh switches to #setopt  autocd autopushd \ pushdignoredups

#Now you can type d to see the first ten items in the list and the number to switch to it
d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'

#Command completion is enabled by default with Oh My Zsh. To enable it, add the following lines to your .zshrc file:
#autoload -U compinit
#compinit

# -------------------------------------------------------------------------------------------
# keyfunction
# -------------------------------------------------------------------------------------------

#Note:
#To bind a command to a keystroke, you need the "-s" option to bindkey.
#However, note it's doing something rather different --- basically just
#dumping the keys you type into the command line.  One idiom for running
#"foo" this way is to use ^q to ensure there's nothing else in the buffer
#(if there is, you don't lose it, you get it back after running foo), and
#put a newline at the end.  Luckily you can use the same abbreviations
#for keys as in the keystroke part of the command:
#bindkey -s '<keystroke>' '^qfoo\n'
#bindkey -s '^[OP' '^qget-help\n'
#bindkey -s '^[H' '^qget-help\n'
#bindkey -s '^[H' 'get-help'

case $TERM in
  linux )
    #echo "Linux/console term found"
    #You can find the string to put into bindkey by typing ctrl-v and then your desired keystroke.
    bindkey -s '^[[[A' '^qget-help\n' # da terminale console [F1]
    bindkey -s '^[[[B' '^qget-sys-info\n' # da terminale console [F2]
    bindkey -s '^[[[B' '^qclear\n' # da terminale console [F3]
    #bindkey -s '^[[[D' '^qget-help\n' # da terminale console [F4]
    bindkey -s '^[[[E' '^qupdate\n' # da terminale console [F5]
    #bindkey -s '^[[17~' '^qget-help\n' # da terminale console [F6]
    #bindkey -s '^[[18~' '^qget-help\n' # da terminale console [F7]
    #bindkey -s '^[[19~' '^qget-help\n' # da terminale console [F8]
    #bindkey -s '^[[20~' '^qget-help\n' # da terminale console [F9]
    #bindkey -s '^[[21~' '^qget-help\n' # da terminale console [F10]
    #bindkey -s '^[[23~' '^qget-help\n' # da terminale console [F11]
    #bindkey -s '^[[24~' '^qget-help\n' # da terminale console [F12]
    ;;
  xterm* )
    #echo "Xterm found"
    #You can find the string to put into bindkey by typing ctrl-v and then your desired keystroke.
    bindkey -s '^[OP' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F1]
    bindkey -s '^[OQ' '^qget-sys-info\n' # da terminale Xterm (Predefinito XFree 4) [F2]
    bindkey -s '^[OR' '^qclear\n' # da terminale Xterm (Predefinito XFree 4) [F3]
    #bindkey -s '^[OS' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F4]
    bindkey -s '^[[15~' '^qupdate\n' # da terminale Xterm (Predefinito XFree 4) [F5]
    #bindkey -s '^[[17~' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F6]
    #bindkey -s '^[[18~' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F7]
    #bindkey -s '^[[19~' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F8]
    #bindkey -s '^[[20~' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F9]
    #bindkey -s '^[[21~' '^qget-help\n' # da terminale Xterm (Predefinito XFree 4) [F10]
    #F11 usato dal terminale
    #F12 usato dal sistema

    ;;
  * )
esac

#F5
#^[[15~
#F6
#^[[17~
#F7
#^[[18~
#
#Binding a function to a key is quite easy. You just need to turn the function
# into a ZSH Widget first. For example:
#% function hello_function { echo "hello" }
#% zle -N hello_widget hello_function
#% bindkey '=' hello_widget
#
# per cancellare:
#bindkey -r "^X^B"
#You can find the string to put into bindkey by typing ctrl-v and then your desired keystroke.

#https://sgeb.io/posts/2014/04/zsh-zle-custom-widgets/
#bindkey -s '\es' '^qget-help\n' #ok alt+s
#bindkey -s '^[[25~' '^qget-help\n'
#bindkey -s '^[[[A' '^qget-help\n'

#non funziona
#alias reset-simona='bindkey -r "^[[[A" ; bindkey -s "^[[[A" "^qget-help\n"'

#zle -N widget-get-help get-help #ok
#bindkey '\es' widget-get-help   #ok alt+s

#If you have a NeXT keyboard, the one with the | and \ keys very inconveniently placed, the following bindings may come in handy
#bindkey -s '\/' '\\'
#bindkey -s '\=' '|'

#COMBINATIONS USING JUST THE 'GREY' KEYS:
#
#key[F1]        = '^[[[A'
#key[F2]        = '^[[[B'
#key[F3]        = '^[[[C'
#key[F4]        = '^[[[D'
#key[F5]        = '^[[[E'
#key[F6]        = '^[[17~'
#key[F7]        = '^[[18~'
#key[F8]        = '^[[19~'
#key[F9]        = '^[[20~'
#key[F10]       = '^[[21~'
#key[F11]       = '^[[23~'
#key[F12]       = '^[[24~'
#
#key[Shift-F1]  = '^[[25~'
#key[Shift-F2]  = '^[[26~'
#key[Shift-F3]  = '^[[28~'
#key[Shift-F4]  = '^[[29~'
#key[Shift-F5]  = '^[[31~'
#key[Shift-F6]  = '^[[32~'
#key[Shift-F7]  = '^[[33~'
#key[Shift-F8]  = '^[[34~'

# ---------------------------------------------------------------------------------------------------------

#alias case insensitive? da provare
#setopt extendedglob
#unsetopt CASE_GLOB


#setopt hist_ignore_all_dups # remove older duplicate entries from history
#setopt hist_reduce_blanks # remove superfluous blanks from history items
#setopt inc_append_history # save history entries as soon as they are entered
#setopt share_history # share history between different instances of the shell

#unalias
#unfunction

#emula KSH
#setopt KSH_GLOB
#ln -s /bin/zsh /bin/csh

#ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

#AUTO_PUSHD #means that any directory-changing command, including an auto-cd, is treated as a pushd command

#disable cmd #????

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# -------------------------------------------------------------------------------------------
# ZHLovers e others
# -------------------------------------------------------------------------------------------

#alias -g ...='../..'
#alias -g ....='../../..'
#alias -g .....='../../../..'
#alias -g CA="2>&1 | cat -A"
#alias -g C='| wc -l'
#alias -g D="DISPLAY=:0.0"
#alias -g DN=/dev/null
#alias -g ED="export DISPLAY=:0.0"
#alias -g EG='|& egrep'
#alias -g EH='|& head'
#alias -g EL='|& less'
#alias -g ELS='|& less -S'
#alias -g ETL='|& tail -20'
#alias -g ET='|& tail'
#alias -g F=' | fmt -'
#alias -g G='| egrep'
#alias -g H='| head'
#alias -g HL='|& head -20'
#alias -g Sk="*~(*.bz2|*.gz|*.tgz|*.zip|*.z)"
#alias -g LL="2>&1 | less"
#alias -g L="| less"
#alias -g LS='| less -S'
#alias -g MM='| most'
#alias -g M='| more'
#alias -g NE="2> /dev/null"
#alias -g NS='| sort -n'
#alias -g NUL="> /dev/null 2>&1"
#alias -g PIPE='|'
#alias -g R=' > /c/aaa/tee.txt '
#alias -g RNS='| sort -nr'
#alias -g S='| sort'
#alias -g TL='| tail -20'
#alias -g T='| tail'
#alias -g US='| sort -u'
#alias -g VM=/var/log/messages
#alias -g X0G='| xargs -0 egrep'
#alias -g X0='| xargs -0'
#alias -g XG='| xargs egrep'
#alias -g X='| xargs'

#use cache for faster usage
#zstyle ':completion:*' use-cache on
#zstyle ':completion:*' cache-path ~/.zsh/cache

#zstyle ':completion:*:*:xdvi:*' menu yes select
#zstyle ':completion:*:*:xdvi:*' file-sort time

#If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
#zstyle ':completion:*' squeeze-slashes true

#cd will never select the parent directory (e.g.: cd ../<TAB>):
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'   # case insensitive completion for cd etc *N*


#Zsh can be configured to remember the DIRSTACKSIZE last visited folders. This can then be used to cd them very quickly. You need #to add some lines to your configuration file:
#
#DIRSTACKFILE="$HOME/.cache/zsh/dirs"
#if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#  [[ -d $dirstack[1] ]] && cd $dirstack[1]
#fi
#chpwd() {
#  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
#}
#
#DIRSTACKSIZE=20
#
#setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
#
### Remove duplicate entries
#setopt PUSHD_IGNORE_DUPS
#
### This reverts the +/- operators.
#setopt PUSHD_MINUS
#
#Now use
#
#$ dirs -v
#
#to print the dirstack. Use cd -<NUM> to go back to a visited folder. Use autocompletion after the dash. This proves very handy if using the autocompletion menu.
#
#cdr
#
#cdr allows you to change the working directory to a previous working directory from a list maintained automatically. It stores all entries in files that are maintained across sessions and (by default) between terminal emulators in the current session.


#alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov,mkv}="mplayer"

#if [[ $ZSH_VERSION == 3.1.<5->* ||
#      $ZSH_VERSION == 3.<2->* ||
#      $ZSH_VERSION == <4->* ]]; then
# set feature which appeared first in 3.1.5
#fi


#if [[ -r ~/.aliasrc ]]; then
#  . ~/.aliasrc
#fi

#ZSH_HINTS=()
#ZSH_HINTS+=("CTRL + A Move to the beginning of the line")
#ZSH_HINTS+=("CTRL + E Move to the end of the line")
#ZSH_HINTS+=("ALT + B  Move one word backward")
#ZSH_HINTS+=("ALT + F Move one word forward")
#ZSH_HINTS+=("CTRL + U Clear the entire line")
#ZSH_HINTS+=("CTRL + K Clear the characters on the line after the current cursor position")
#ZSH_HINTS+=("CTRL + W Delete a word before the cursor")
#ZSH_HINTS+=("ALT + D  Delete a word after the cursor")
#ZSH_HINTS+=("CTRL + R Search history")
#ZSH_HINTS+=("CTRL + G Escape from search mode")
#ZSH_HINTS+=("CTRL + _ Undo the last change")
#ZSH_HINTS+=("CTRL + L Clear screen")
#ZSH_HINTS+=("CTRL + C Terminate/kill current foreground process")
#ZSH_HINTS+=("CTRL + Z Suspend/stop current foreground process")
#cowsay ${ZSH_HINTS[$(($(($RANDOM % ${#ZSH_HINTS})) + 1))]}

# Midnight Commander chdir enhancement
#if [ -f /usr/lib/mc/mc.sh ]; then
#  source /usr/lib/mc/mc.sh
#fi

#wd() {
#  . /usr/share/wd/wd.sh
#}

#/usr/share/zsh/plugins/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh
#source ~/.zsh/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh

#bindkey    "^[[3~"          delete-char
#bindkey    "^[3;5~"         delete-char

#typeset -A key

#key[Home]=${terminfo[khome]}
#key[End]=${terminfo[kend]}
#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

# setup key accordingly
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-search-backward
#[[ -n "${key[PageDown]}"   ]]  && bindkey  "${key[PageDown]}"   history-search-forward



# -------------------------------------------------------------------------------------------
# Tema agnoster modificato derivazione powerline oh-my-zsh/themes/agnoster-simona-zsh-theme
# -------------------------------------------------------------------------------------------

CURRENT_BG='NONE' #ok avvio sequenza gestione cambio colori
#CURRENT_BG='white' #angolino bianco all'inzio
#CURRENT_BG='black' #come none

#CURRENT_FG='black' #ok ma non più usato
#CURRENT_FG='white' #commentato fin dall'inizio

# Special Powerline characters

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
  # NOTE: This segment separator character is correct.  In 2012, Powerline changed
  # the code points they use for their special characters. This is the new code point.
  # If this is not working for you, you probably have an old version of the
  # Powerline-patched fonts installed. Download and install the new version.
  # Do not submit PRs to change this unless you have reviewed the Powerline code point
  # history and have new information.
  # This is defined using a Unicode escape sequence so it is unambiguously readable, regardless of
  # what font the user is viewing this source code in. Do not replace the
  # escape sequence with a single literal character.
  # Do not change this! Do not make it '\u2b80'; that is the old, wrong code point.

  # 
  SEGMENT_SEPARATOR=$'\ue0b0'
  #SEGMENT_SEPARATOR=''
  #SEGMENT_SEPARATOR='►' #windows
}

# ==============================================================================================================
# TO-DO provare a cambiare ordine e scrivere il '>' dopo la scritta e non prima del sucessivo dato
# ==============================================================================================================

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  #legge colore di sfondo $1 e testo $2 per il testo da scrivere $3
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k" #carica colore sfondo da $n o predefinito (background)
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f" #carica colore caratteri da $n o predefinito (foreground)

  # scrive separatore iniziale '>' #echo '\ue0b0' se cambia colore di sfondo
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} " #scrive separatore usando precedente colore di sfondo
  else
    echo -n "%{$bg%}%{$fg%} " #imposta colore (senza prima mettere separatore)
  fi
  CURRENT_BG=$1 #poiché la chiusura > verrà fatta all'inizio della riga successiva questo riporta il colore da usare

  # scrive testo
  [[ -n $3 ]] && echo -n $3 #scrive stringa dati e termina
}

# End the prompt, closing any open segments
prompt_end() {
  # scrive sepratore finale '>' #echo '\ue0b0'
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG='' #chiude storico colore prossima '>'
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {

  #crea lista simboli
  local symbols
  symbols=()
  #[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $RETVAL -gt 1 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡" #power user (root)
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  #[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS"
  #[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$LIGHTNING"
  #[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"
  #echo -e "\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2"
  #       
  #echo "<2b80> ± <2b60> ➦ ✔ ✘ ⚡"
  #<2b80> ± <2b60> ➦ ✔ ✘ ⚡
  #  ✚ ● ⚙
  # Characters
  #SEGMENT_SEPARATOR="\ue0b0"
  #PLUSMINUS="\u00b1"
  #BRANCH="\ue0a0"
  #DETACHED="\u27a6"
  #CROSS="\u2718"
  #LIGHTNING="\u26a1"
  #GEAR="\u2699"
  # ➙ ⬆ ⬇ ✱ ◷
  #'\uE271'
  #'\uF17C' 


  #se lista simboli non vuota scrive qualcosa
  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

#autoload colors
#print -P %F{red}ciao
#echo ${(%):-%F{red}}ciao
#typeset fg_bold
#fg_bold=( [black]=$'\C-[[01;30m' [blue]=$'\C-[[01;34m' [cyan]=$'\C-[[01;36m' [default]=$'\C-[[01;39m' [green]=$'\C-[[01;32m' [grey]=$'\C-[[01;30m' [magenta]=$'\C-[[01;35m' [red]=$'\C-[[01;31m' [white]=$'\C-[[01;37m' [yellow]=$'\C-[[01;33m' )
#typeset fg
#fg=( [black]=$'\C-[[30m' [blue]=$'\C-[[34m' [cyan]=$'\C-[[36m' [default]=$'\C-[[39m' [green]=$'\C-[[32m' [grey]=$'\C-[[30m' [magenta]=$'\C-[[35m' [red]=$'\C-[[31m' [white]=$'\C-[[37m' [yellow]=$'\C-[[33m' )
#echo ${(o)color}
#00 01 02 03 04 05 07 08 22 23 24 25 27 28 30 30 30 30 31 31 32 32 33 33 34 34 35 35 36 36 37 37 39 39 40 40 41 42 43 44 45 46 47 49 bg-black bg-blue bg-cyan bg-default bg-green bg-magenta bg-red bg-white bg-yellow black blink blue bold conceal cyan default faint green magenta no-blink no-conceal none no-reverse normal no-standout no-underline red reverse standout underline white yellow
#less $^fpath/colors(N)
#which colors
#lege contneuto funzioni definire

prompt_shell() {
  prompt_segment black green "zsh"
  #prompt_segment black green "zsh"

  #local st
  #st=()
  #st+="%{%F{red}%}"
  #st+="${(%):-%F{red}%}zsh"
  #st+="%{$fg_no_bold[red]%}zsh"
  #st+="%{$fg_bold[red]%}zsh%{$reset_color%}"
  #st+="%{$fg[green]zsh%{$reset_color%}zsh2"
  #prompt_segment black green "$st"

}

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then

    #simona 2018-09-17
    if [[ $UID -eq 0 ]]; then
      prompt_segment red default "%(!.%{%F{white}%}.)$USER@%m"
    else
      prompt_segment magenta yellow "%(!.%{%F{yellow}%}.)$USER@%m"
    fi

    #RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE

    #simona 2018-09-12
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m"
    #prompt_segment yellow $CURRENT_FG "%(!.%{%F{yellow}%}.)$USER@%m"
    #prompt_segment green $CURRENT_FG "%(!.%{%F{yellow}%}.)$USER@%m"

    #prompt_segment green black "%(!.%{%F{yellow}%}.)$USER@%m"
    #prompt_segment cyan black "%(!.%{%F{yellow}%}.)$USER@%m"
    #prompt_segment magenta white "%(!.%{%F{yellow}%}.)$USER@%m"
    #prompt_segment magenta yellow "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

#VOLTAGE_DROP=43
#MAX_VOLTAGE=4202
#MIN_VOLTAGE=3600
#function batteryIndicator() {
#  is_charging=$(cat /usr/lib/pocketchip-batt/charging)
#  voltage=$(cat /usr/lib/pocketchip-batt/voltage)
#  voltage_offset=$(bc <<< "$is_charging*$VOLTAGE_DROP")
#  excess_voltage=$(bc <<< "$voltage-$voltage_offset-$MIN_VOLTAGE")
#  max_excess_voltage=$(bc <<< "$MAX_VOLTAGE-$VOLTAGE_DROP-$MIN_VOLTAGE")
#  percentage=$(bc <<< "scale=2; $excess_voltage/($max_excess_voltage/100)")
#  battStatus="-" && [[ "$is_charging" == 1 ]] && battStatus="+"
#  if (( $(bc <<< "$percentage < 20") ))
#  then
#    statusColor=red
#  else
#    statusColor=green
#  fi
#  echo "%B%F{${statusColor}}%}$percentage$battStatus"
#}

# Dir: current working directory
prompt_dir() {
  #simona 2018-09-12
  #prompt_segment blue $CURRENT_FG '%~'
  prompt_segment blue white '%~'
  #prompt_segment blue lightblue '%~'
}

#simona
## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_shell
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_end
}

# ----------------------------------------------------------------------------------------
# another prompt
# ----------------------------------------------------------------------------------------

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '%(!.!.➜)'
}


function parse_hg_dirty {
  if [[ -n $(hg status -mard . 2> /dev/null) ]]; then
    echo "$ZSH_THEME_HG_PROMPT_DIRTY"
  fi
}

function get_RAM {
  free -m | awk '{if (NR==3) print $4}' | xargs -i echo 'scale=1;{}/1000' | bc
}

function get_nr_jobs() {
  jobs | wc -l
}

function get_nr_CPUs() {
  grep -c "^processor" /proc/cpuinfo
}

function get_load() {
  uptime | awk '{print $11}' | tr ',' ' '
}

function prompt_ifho() {
  PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[cyan]%}%2c %{$fg_bold[blue]%}$(git_prompt_info)$(parse_hg_dirty)%{$fg_bold[blue]%} %{$fg_bold[red]%}$(prompt_char) % %{$reset_color%}'

  RPROMPT='%{$fg_bold[red]%}[$(get_nr_jobs), $(get_RAM)G, $(get_load)($(get_nr_CPUs))] %{$fg_bold[green]%}%*%{$reset_color%}'

  ZSH_THEME_HG_PROMPT_PREFIX="hg:(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
  ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
}

# ----------------------------------------------------------------------------------------
# Setup prompt
# Zsh supports:
#     left side prompts: PS1 (or PROMPT), PS2, PS3, PS4.
#     right side prompts: RPS1 (or RPROMPT), RPS2 (or RPROMPT2).
# ----------------------------------------------------------------------------------------

#simona
prompt_powerline_simona() {
  PROMPT='%{%f%b%k%}$(build_prompt) '
  RPROMPT='[%F{yellow}%?%f]' #aggiunta mia di prova
}

#TO-DO bold
prompt_powerline_std() { #powerline
  [ -r "/usr/bin/powerline-daemon" ] &&
    powerline-daemon -q
  [ -r "/usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh" ] &&
  . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh
  #. /usr/share/powerline/bindings/zsh/powerline.sh
}

#boh...
prompt_purelinel() {
  declare -a PL_MODULES=(
        # Module                Background  Foreground
        'user_module            Yellow      Black'
        'path_module            Blue        Black'
        'read_only_module       Red         White'
    )

  if [[ -r "/usr/share/pureline/pureline" ]]; then
    source /usr/share/pureline/pureline ~/.pureline.conf
  fi
}

#funziona su termite ma non su konsole
prompt_powerlevel-manuale() {

  # Fix icone konsole
  #
  # Icons are cut off
  #
  # If you notice cut off icons like this:
  #
  # It's probably because your terminal emulator is not capable of displaying double-width glyphs.
  # KDEs Konsole is well known for such a behaviour. Luckily there is a workaround for that.
  # Try adding a whitespace after the code point,
  # example: POWERLEVEL9K_HOME_SUB_ICON=$'\UE18D ' # <- Whitespace added. You can get a list of all icons by calling get_icon_names.

  #git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  #POWERLEVEL9K_MODE='awesome-fontconfig' #icone difettose
  #POWERLEVEL9K_MODE='awesome-mapped-fontconfig' #prompt incompleto
  POWERLEVEL9K_MODE='nerdfont-complete' #quasi decente
  #POWERLEVEL9K_MODE='flat' [alcune icone mancanti
  #POWERLEVEL9K_MODE='awesome-patched' #alcune icone mancanti
  #default power-line patched #incompleto

  #[ -r "/usr/share/pureline/pureline" ] &&
  #[ -r "/usr/share/zsh-theme-powerlevel10k" ] &&
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  #[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
  #[[ -f /usr/share/zsh-theme-powerlevel10k/internal/p10k.zsh ]] && source /usr/share/zsh-theme-powerlevel10k/internal/p10k.zsh
  #[[ -f /usr/share/zsh-theme-powerlevel10k/config/p10k-lean.zsh ]] && source /usr/share/zsh-theme-powerlevel10k/config/p10k-lean.zsh

  #(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize
  POWERLEVEL9K_INSTANT_PROMPT=off
  #typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  #POWERLEVEL9K_INSTANT_PROMPT=quit #suppress warning
  #typeset -g POWERLEVEL9K_INSTANT_PROMPT=quit #suppress warning

  #prompt_powerlevel9k_teardown
  #prompt_powerlevel9k_setup
  #icon cut off

  POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
  POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

  #POWERLEVEL9K_ANDROID_ICON=''
  #POWERLEVEL9K_APPLE_ICON=''
  #POWERLEVEL9K_AWS_EB_ICON=''
  #POWERLEVEL9K_AWS_ICON=''
  POWERLEVEL9K_BACKGROUND_JOBS_ICON=' '
  #POWERLEVEL9K_BATTERY_ICON=''
  #POWERLEVEL9K_CARRIAGE_RETURN_ICON='↵'
  POWERLEVEL9K_DATE_ICON=''
  #POWERLEVEL9K_DISK_ICON=''
  #POWERLEVEL9K_DROPBOX_ICON=''
  POWERLEVEL9K_ETC_ICON=' '
  #POWERLEVEL9K_EXECUTION_TIME_ICON=''
  #printf "\xE2\x9C\x97"
  POWERLEVEL9K_FAIL_ICON=' '
  POWERLEVEL9K_FOLDER_ICON=' '
  #POWERLEVEL9K_FREEBSD_ICON=''
  #POWERLEVEL9K_GO_ICON=''
  POWERLEVEL9K_HOME_ICON=' '
  POWERLEVEL9K_HOME_SUB_ICON=' '
  #POWERLEVEL9K_JAVA_ICON='☕'
  #POWERLEVEL9K_KUBERNETES_ICON='⎈'
  #POWERLEVEL9K_LARAVEL_ICON=''
  #POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=' '
  POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  #POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
  #POWERLEVEL9K_LINUX_ALPINE_ICON=''
  #POWERLEVEL9K_LINUX_AOSC_ICON=''
  POWERLEVEL9K_LINUX_ARCH_ICON=' '
  #POWERLEVEL9K_LINUX_CENTOS_ICON=''
  #POWERLEVEL9K_LINUX_COREOS_ICON=''
  #POWERLEVEL9K_LINUX_DEBIAN_ICON=''
  #POWERLEVEL9K_LINUX_DEVUAN_ICON=''
  #POWERLEVEL9K_LINUX_ELEMENTARY_ICON=''
  #POWERLEVEL9K_LINUX_FEDORA_ICON=''
  #POWERLEVEL9K_LINUX_GENTOO_ICON=''
  #POWERLEVEL9K_LINUX_ICON=''
  #POWERLEVEL9K_LINUX_MAGEIA_ICON=''
  #POWERLEVEL9K_LINUX_MANJARO_ICON=''
  #POWERLEVEL9K_LINUX_MINT_ICON=''
  #POWERLEVEL9K_LINUX_NIXOS_ICON=''
  #POWERLEVEL9K_LINUX_OPENSUSE_ICON=''
  #POWERLEVEL9K_LINUX_SABAYON_ICON=''
  #POWERLEVEL9K_LINUX_SLACKWARE_ICON=''
  #POWERLEVEL9K_LINUX_UBUNTU_ICON=''
  POWERLEVEL9K_LOAD_ICON=' '
  POWERLEVEL9K_LOCK_ICON=' '
  POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='╭─'
  POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='╰─'
  #POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='├─'
  POWERLEVEL9K_NETWORK_ICON=' '
  #POWERLEVEL9K_NODE_ICON=''
  POWERLEVEL9K_OK_ICON=' '
  #POWERLEVEL9K_PUBLIC_IP_ICON=''
  #POWERLEVEL9K_PYTHON_ICON=''
  POWERLEVEL9K_RAM_ICON=' '
  POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
  #POWERLEVEL9K_ROOT_ICON=''
  #POWERLEVEL9K_RUBY_ICON=''
  #POWERLEVEL9K_RUST_ICON=''
  #POWERLEVEL9K_SERVER_ICON=''
  POWERLEVEL9K_SSH_ICON=' '
  POWERLEVEL9K_SUDO_ICON=' '
  #POWERLEVEL9K_SUNOS_ICON=''
  POWERLEVEL9K_SWAP_ICON=' '
  #POWERLEVEL9K_SWIFT_ICON=''
  #POWERLEVEL9K_SYMFONY_ICON=''
  #POWERLEVEL9K_TEST_ICON=''
  POWERLEVEL9K_TIME_ICON=' '
  POWERLEVEL9K_TODO_ICON=' '
  #POWERLEVEL9K_VCS_BOOKMARK_ICON=''
  POWERLEVEL9K_VCS_BRANCH_ICON=' '
  POWERLEVEL9K_VCS_COMMIT_ICON=' '
  POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=' '
  POWERLEVEL9K_VCS_GIT_GITHUB_ICON=' '
  POWERLEVEL9K_VCS_GIT_GITLAB_ICON=' '
  POWERLEVEL9K_VCS_GIT_ICON=' '
  #POWERLEVEL9K_VCS_HG_ICON=''
  #POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=''
  #POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=''
  #POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=''
  #POWERLEVEL9K_VCS_STAGED_ICON=''
  #POWERLEVEL9K_VCS_STASH_ICON=''
  #POWERLEVEL9K_VCS_SVN_ICON=''
  #POWERLEVEL9K_VCS_TAG_ICON=''
  #POWERLEVEL9K_VCS_UNSTAGED_ICON=''
  #POWERLEVEL9K_VCS_UNTRACKED_ICON=''
  #POWERLEVEL9K_VPN_ICON='(vpn)'
  #POWERLEVEL9K_WINDOWS_ICON=''

  # Disable dir/git icons
  #POWERLEVEL9K_HOME_ICON=''
  #POWERLEVEL9K_HOME_SUB_ICON=''
  #POWERLEVEL9K_FOLDER_ICON=''
  #
  #POWERLEVEL9K_VCS_GIT_ICON=''
  #POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
  #POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
  #POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
  #POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
  #POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
  #
  #POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
  #POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
  ##POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  #

  # https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt

  POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
  POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
  POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='green'
  POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
  POWERLEVEL9K_DIR_ETC_BACKGROUND='green'
  POWERLEVEL9K_DIR_ETC_FOREGROUND='black'

  #POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'

  #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
  #for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"

  #Segments with state are:
  #Segment 	States
  #battery 	LOW, CHARGING, CHARGED, DISCONNECTED
  #context 	DEFAULT, ROOT, SUDO, REMOTE, REMOTE_SUDO
  #dir 	HOME, HOME_SUBFOLDER, DEFAULT, ETC
  #dir_writable 	FORBIDDEN
  #disk_usage 	NORMAL, WARNING, CRITICAL
  #host 	LOCAL, REMOTE
  #load 	CRITICAL, WARNING, NORMAL
  #rspec_stats 	STATS_GOOD, STATS_AVG, STATS_BAD
  #status 	ERROR, OK (note: only, if verbose is not false)
  #symfony2_tests 	TESTS_GOOD, TESTS_AVG, TESTS_BAD
  #user 	DEFAULT, SUDO, ROOT
  #vcs 	CLEAN, UNTRACKED, MODIFIED
  #vi_mode 	NORMAL, INSERT

  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user virtualenv root_indicator dir background_jobs)
  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time ram)
  #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
  #POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv rbenv rvm time)
  #
  #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
  #POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
  #
  #POWERLEVEL9K_DATE_ICON
  POWERLEVEL9K_TIME_FORMAT="%D{%H:%M  %d.%m.%y}"
  #
  #POWERLEVEL9K_STATUS_VERBOSE=true

}

#non funziona
prompt_gbt() {
  #"gbt" Highly configurable prompt builder for Bash and ZSH written in Go
  #https://github.com/jtyr/gbt
  # Basic prompt
  if [[ "$TERM" != xterm* ]]; then
    export GBT_CARS='Hostname, Dir, Sign'
    export GBT_CAR_BG='default'
    export GBT_CAR_FG='default'
    export GBT_CAR_HOSTNAME_ADMIN_FG='red'
    export GBT_CAR_HOSTNAME_FORMAT='{{ UserHost }} '
    export GBT_CAR_HOSTNAME_HOST_FM='bold'
    export GBT_CAR_HOSTNAME_USER_FM='bold'
    export GBT_CAR_DIR_FG='light_blue'
    export GBT_CAR_DIR_FORMAT='{{ Dir }}'
    export GBT_SEPARATOR=''
  fi
  PROMPT='$(gbt $?)'
  GBT_CARS='Status, Os, Hostname, Dir, Sign'
}

#distro
prompt_p10k() {
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  echo "'p10k configure' to setup"
}

#test manual distro
prompt_p10k_test() {
  if [[ -r ~/cmd/powerlevel10k/powerlevel10k.zsh-theme ]]; then
      source ~/cmd/powerlevel10k/powerlevel10k.zsh-theme
      # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
      [[ ! -f ~/cmd/p10k.zsh ]] || source ~/cmd/p10k.zsh
      typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
      echo "'p10k configure' to setup"
  fi
}

#simonarc carica va variabile TTY_REAL e qundi va carica PRIMA di usarla
#if [ "$TERM" = "linux" ]; then
#term_sw=$(sget-binterm)
#echo "Term sw is <$term_sw>"

#if [[ $full_display -eq 1 ]] ; then

  #problema: entrando come su term_sw diventa 'su'

  #if [[ "$term_sw" == "alacritty" ]] ; then
  #  prompt_powerlevel9k

  (tty | grep -q "/dev/tty") && TTY_REAL="Yes" || unset TTY_REAL #ok

  #elif [[ "$term_sw" == "termite" ]] ; then
  if [[ "$term_sw" == "termite" ]] ; then
  #if [[ "$term_sw" == "termite" ]] || [[ "$term_sw" == "su" ]] ; then
    if [[ ! -n "$TTY_REAL" ]] ; then
      # ┌─╼[~]
      # └────╼
      #[[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_powerlevel-manuale #ok
      [[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_p10k #uses ~/.p10k.zsh #ok
      #[[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_powerline_simona #completamente personalizzato a mano

    #else
    #  ZSH_THEME="linuxonly"
    #  echo "<<zsh>>"
    fi
  else
    #[[ ! -n "$TTY_REAL" ]] && prompt_powerlevel9k || echo "<<zsh>>"
    if [[ ! -n "$TTY_REAL" ]] ; then
      #  zsh  simona@simonapc1  ~ 
      #[[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_powerlevel-manuale #ok
      #[[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_p10k #uses .p10k.zsh #ok
      #prompt_powerline_simona #completamente personalizzato a mano
      [[ -r "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]] && prompt_powerline_simona
      #prompt_purelinel
    else
      #PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
      ZSH_THEME="linuxonly"
      #ZSH_THEME=""
      echo "<<zsh>>"
      #prompt_p10k
    fi
  fi
  #[[ ! -n "$TTY_REAL" ]] && prompt_powerline_std || echo "<<zsh>>"
  #[[ ! -n "$TTY_REAL" ]] && prompt_powerlevel9k || echo "<<zsh>>"
  #[[ ! -n "$TTY_REAL" ]] && prompt_gbt || echo "<<zsh>>"

#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="pygmalion"
#ZSH_THEME="risto"
#ZSH_THEME="agnoster-simona"
#ZSH_THEME="agnoster"
#ZSH_THEME="3den"
#ZSH_THEME="muse"
#ZSH_THEME="linuxonly"


# -------------------------------------------------------------------------------------------------

#autoload -Uz promptinit
#promptinit
#prompt -l #Available prompt themes are listed by running the command
#prompt walters #For example, to use the walters theme
#prompt -p #To preview all available themes, use this command
#Install new theme manually:
#mkdir ~/.zprompts && fpath=( "$HOME/.zprompts" $fpath ) #create folder
#ln -s mytheme.zsh ~/.zprompts/prompt_mytheme_setup
#ln -s mytheme.zsh /usr/share/zsh/functions/Prompts/prompt_mytheme_setup #globally
#prompt mytheme #now activate

#colors:
#black or 0 	red or 1
#green or 2 	yellow or 3
#blue or 4 	magenta or 5
#cyan or 6 	white or 7

#Prompt escapes can be tested with command print -P "prompt escapes", for example:
#$ print -P '%B%F{red}co%F{green}lo%F{blue}rs%f%b'
#example
#PROMPT='%F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %# '
#RPROMPT='[%F{yellow}%?%f]'
#RPROMPT='[%F{yellow}%?%f]'


#debug
#echo "**zsh**"

#non cancellare per nessun motivo su bash
#export $(dbus-launch)

[ -r /home/simona/.config/broot/launcher/bash/br ] &&
  source /home/simona/.config/broot/launcher/bash/br

#source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
