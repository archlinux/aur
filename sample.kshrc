# This file contains examples of some of the things you may want to
# include in a user startup file.

# skip this setup for non-interactive shells
[[ -o interactive && -t 0 ]] || return

# disable core dumps
ulimit -c 0

# Environment variables. These could go in .profile if you prefer
export VISUAL=vi
export EDITOR=$VISUAL
export PAGER=less
export GZIP=-9

# set some shell options
set -o emacs -o trackall -o globstar

# specify search path for autoloadable functions
FPATH=/usr/share/ksh/functions:~/.func

# avoid certain file types in completion
FIGNORE='@(*.o|~*)'

# save more commands in history
HISTSIZE=500
HISTEDIT=$EDITOR

# aliases for various command shortcuts
alias ll='ls -lFb'
alias la='ls -LaFb'
alias pu='ps -fu $USER'
alias md=mkdir
alias rd=rmdir

# avoid problems with long argument lists for some commands (like xargs)
alias cp='command -x cp'  mv='command -x mv'  grep='command -x grep'

# some short functions

# empty line
empty() { echo $'\e[3J'; }

# man page viewer
mere() { nroff -man -Tman $1 | ${MANPAGER:-less}; }

# view/manipulate and export environment variables
setenv() {
        case $# in
        0) export ;;
        1) export "$1"= ;;
        *) export "$1"="$2" ;;
        esac
    }

# Use keyboard trap to map keys to other keys
# note that escape sequences vary for different terminals so these
# may not work for you
trap '.sh.edchar=${keymap[${.sh.edchar}]:-${.sh.edchar}}' KEYBD
keymap=(
  [$'\eOD']=$'\eb'   # Ctrl-Left  -> move word left
  [$'\eOC']=$'\ef'   # Ctrl-Right -> move word right
  [$'\e[3~']=$'\cd'  # Delete     -> delete to right
  [$'\e[1~']=$'\ca'  # Home       -> move to beginning of line
  [$'\e[4~']=$'\ce'  # End        -> move to end of line
)

# keep a shortened version of the current directory for the prompt
function _cd {
  typeset -n dir=HOME

  "cd" "$@"

  if [[ $PWD = $HOME* && $HOME != / ]]; then
    _pwd=\~${PWD#$HOME}
    return
  fi

  for dir in JAVA_HOME GNOMEDIR; do
    if [[ -n $dir && $PWD = $dir* ]]; then
      _pwd="\$${!dir}${PWD#$dir}"
      return
    fi
  done
  _pwd="$PWD"
}
alias cd=_cd
_cd .

# put the current directory and history number in the prompt
PS1='$_pwd [!]\$ '
