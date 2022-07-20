## Set oh-my-posh and themes
_POSH_THEME="/usr/share/oh-my-posh/themes/jandedobbeleer.omp.json"
if [[ -r "${_POSH_THEME}" ]];then
  export POSH_THEME="${_POSH_THEME}"
  eval "$(oh-my-posh init zsh)"
else
  echo "Warning: \"${_POSH_THEME}\" is unreachable!"
  echo "Oh My Posh theme is disabled! Using the fallback \"elite2\" theme now!"
  echo "Please check your theme file's existance and read permission!"
  echo "Tips: run \"sudo chmod +r -R /usr/share/oh-my-posh/\" may helps when there're permission issues."
  autoload -U promptinit
  promptinit
  prompt elite2 green yellow
fi

## Import easy-zsh-config
if [[ -r /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
