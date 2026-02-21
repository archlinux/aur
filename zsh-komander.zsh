# Установка параметров #
setopt inc_append_history
setopt share_history
setopt autocd
setopt beep

# Установка файла истории #
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Проверка и создание файла истории #
if [[ -f "${HOME}/.zsh_history" ]]; then
	;
else
	touch ${HOME}/.zsh_history
fi

usr=""
pc=""
pw=""
vnv=""

# Установка запроса #
PROMPT="$vnv$usr$pc$pw> "

# Функция обновления запроса #
update_prompt() {
	PROMPT="$vnv$usr$pc$pw> "
	zle reset-prompt
}

# Переключатель видимости пользователя #
tgusr() {
	if [[ -z "$usr" && -z "$pc" ]]; then # Если не видно хоста и пользователя
		usr="%n "
	elif [[ -z "$usr" && -n "$pc" ]]; then # Если не видно пользователя, но виден хост
		usr="%n@"
	else
		usr=""
	fi
	update_prompt
}

# Переключатель видимости хоста #
tgpc() {
	if [[ -z "$pc" && -z "$usr" ]]; then # Если невидно хоста и пользователя
		pc="%m "
	elif [[ -n "$pc" && -n "$usr" ]]; then # Если видно и хоста и пользователя
		pc=""
		usr="%n "
	elif [[ -z "$pc" && -n "$usr" ]]; then # Если не видно хоста, но видно пользователя
		pc="%m "
		usr="%n@"
	else
		pc=""
	fi
	update_prompt
}

# Переключатель видимости пути #
tgpwd() {
	if [[ -z "$pw" ]]; then
		pw="%d "
	else
		pw=""
	fi
	update_prompt
}

# Переключатель видимости виртуального окружения #
tgvnv() {
	VENV="null"
	if [[ -n $VIRTUAL_ENV ]]; then
		VENV=$VIRTUAL_ENV
	else
		VENV="null"
	fi

	if [[ -z "$vnv" ]]; then
		vnv="($(basename $VENV)) "
	else
		vnv=""
	fi
	update_prompt
}

# Установка переключателей #
zle -N tgpc
zle -N tgpwd
zle -N tgusr
zle -N tgvnv

# Создание сочитаний клавиш  #
bindkey "\ez" tgusr
bindkey "\ex" tgpc
bindkey "\ec" tgpwd
bindkey "\ev" tgvnv
