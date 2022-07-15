## Set oh-my-posh and themes
_POSH_THEME="/usr/share/oh-my-posh/themes/jandedobbeleer.omp.json"
if [[ -r "${_POSH_THEME}" ]];then
  POSH_THEME="${_POSH_THEME}"
fi
eval "$(oh-my-posh init zsh)"

## Import easy-zsh-config
if [[ -r /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
