HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt inc_append_history
setopt share_history
setopt autocd
setopt beep

usr=""
pc=""
pw=""
vnv=""

PROMPT="$vnv$usr$pc$pw> "

tgusr() {
if [[ -z "$usr" && -z "$pc" ]]; then
	usr="$USER "
elif [[ -z "$usr" && -n "$pc" ]]; then
	usr=$USER"@"
else
	usr=""
fi
PROMPT="$vnv$usr$pc$pw> "
zle reset-prompt
}

tgpc() {
if [[ -z "$pc" && -z "$usr" ]]; then
	pc="$(uname -n) "
elif [[ -n "$pc" && -n "$usr" ]]; then
	pc=""
	usr="$USER "
elif [[ -z "$pc" && -n "$usr" ]]; then
	pc="$(uname -n) "
	usr=$USER"@"
else
	pc=""
fi
PROMPT="$vnv$usr$pc$pw> "
zle reset-prompt
}

tgpwd() {
if [[ -z "$pw" ]]; then
	pw="$(pwd) "
else
	pw=""
fi
PROMPT="$vnv$usr$pc$pw> "
zle reset-prompt
}

zle -N tgpc
zle -N tgpwd
zle -N tgusr
bindkey "\ez" tgusr
bindkey "\ex" tgpc
bindkey "\ec" tgpwd
