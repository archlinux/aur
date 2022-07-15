## Set oh-my-posh and themes
POSH_THEME="/usr/share/oh-my-posh/themes/jandedobbeleer.omp.json"
if [[ -r ${POSH_THEME} ]];then
  eval "$(oh-my-posh init zsh --config "${POSH_THEME}")"
else
  eval "$(oh-my-posh init zsh)"

## Import easy-zsh-config
if [[ -r /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
