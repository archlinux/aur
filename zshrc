## Set oh-my-posh and themes
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/jandedobbeleer.omp.json)"

## Import easy-zsh-config
if [[ -e /usr/share/zsh/easy-zsh-config ]]; then
  source /usr/share/zsh/easy-zsh-config
fi
