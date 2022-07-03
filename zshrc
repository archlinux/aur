# Set oh-my-posh and themes
eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/jandedobbeleer.omp.json)"

# Set history
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP

# Set plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Set key bindings
bindkey "^[[A" history-substring-search-up      # Up
bindkey "^[[B" history-substring-search-down    # Down
bindkey ";5A" history-beginning-search-backward # Ctrl-Up
bindkey ";5B" history-beginning-search-forward  # Ctrl-Down
bindkey ";5C" emacs-forward-word                # Ctrl-Right
bindkey ";5D" emacs-backward-word               # Ctrl-Left
bindkey "\e[3~" delete-char                     # Del
