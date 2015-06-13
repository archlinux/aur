#compdef fossil

# zsh completion wrapper for zsh by Daniel YC Lin <dlin.tw at gmail.com>
# I'm not zsh expert, please help me to fix this. 2015/02/06
# TODO: fossil add -option<tab>
#
# Usage example:
# 	cp fossil-autocomplete.zsh ~/zshfunc/_fossil
#	fpath=(~/zshfunc $fpath)
#	autoload -U ~/zshfunc/*(:t)
# Package example:
#       install -Dm644 fossil-autocomplete.zsh /share/zsh/site-functions/_fossil

local curcontext="$curcontext" state line expl ret=1
typeset -A opt_args

_arguments -C \
    '(-)--help[print help information]' \
    '1: :->cmds' \
    '*:files:_files' && ret=0

_fossil_cmds=($(LC_ALL=C fossil help -a))
_fossil_commands() {
  compadd "$@" -k _fossil_cmds
}
case $state in
  cmds)
      _wanted commands expl 'fossil help' _fossil_commands && ret=0
  ;;
esac
