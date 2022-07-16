## Set oh-my-posh and themes
_POSH_THEME="/usr/share/oh-my-posh/themes/jandedobbeleer.omp.json"
if [[ -r "${_POSH_THEME}" ]];then
  export POSH_THEME="${_POSH_THEME}"
else
  echo "Warning: \"${_POSH_THEME}\" is unreachable! Using the very slow fallback theme now!"
  echo "Please check your theme file's existance and read permission!"
  echo "Tips: run \"sudo chmod +r -R /usr/share/oh-my-posh/\" may helps when there're permission issues."
fi
eval "$(oh-my-posh init zsh --config ${POSH_THEME})"

## Import easy-zsh-config
if [[ -r /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
