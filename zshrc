## Set oh-my-posh and themes
POSH_THEME_FILE="jandedobbeleer.omp.json"
_POSH_THEME="/usr/share/oh-my-posh/themes/${POSH_THEME_FILE}"
if [[ -r "${_POSH_THEME}" ]];then
  export POSH_THEME="${_POSH_THEME}"
else
  echo "Warning: \"${POSH_THEME_FILE}\" is unreachable! Using the fallback theme now (may be very slow to load)!"
  echo "Please check your theme file's existance and read permission!"
fi
eval "$(oh-my-posh init zsh)"

## Import easy-zsh-config
if [[ -r /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
