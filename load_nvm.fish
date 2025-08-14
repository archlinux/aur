# ~/.config/fish/functions/load_nvm.fish
# Automatically load nvm version when PWD changes
function load_nvm --on-variable="PWD" --description 'Automatically switch Node.js versions based on .nvmrc'
  # Fast startup optimization - only do minimal work during fish startup
  set -l is_startup (not set -q __nvm_fish_pwd_initialized)
  if test -z "$is_startup"
    set -g __nvm_fish_pwd_initialized 1
    # On startup, only set the flag and exit immediately
    # Actual nvm operations will happen on first directory change
    return
  end
  
  # Lightweight check - only proceed if nvm-fish is properly set up
  if not test -f "$HOME/.config/nvm-fish-setup-done"
    return
  end
  
  # Quick bass availability check - avoid heavy sourcing on every directory change
  if not command -v bass >/dev/null 2>&1
    if test -f "$HOME/.config/fish/functions/bass.fish"
      source "$HOME/.config/fish/functions/bass.fish" 2>/dev/null
    else
      return
    end
  end
  
  # Only check for .nvmrc in current directory (fast file check)
  set -l nvmrc_path "$PWD/.nvmrc"
  if test -f "$nvmrc_path"
    # Only call nvm if there's actually a .nvmrc file
    set -l nvmrc_content (cat "$nvmrc_path" 2>/dev/null | string trim)
    if test -n "$nvmrc_content"
      # Check if we're already using this version (avoid unnecessary nvm calls)
      set -l current_version_check (node --version 2>/dev/null | string replace 'v' '')
      set -l target_version (string replace 'v' '' "$nvmrc_content")
      
      if test "$current_version_check" != "$target_version"
        set -l nvmrc_node_version (nvm version "$nvmrc_content" 2>/dev/null)
        if test "$nvmrc_node_version" = "N/A"
          nvm install "$nvmrc_content"
        else
          nvm use "$nvmrc_content"
        end
      end
    end
  else
    # Only revert to default if we're not already on default
    # This avoids calling nvm on every directory without .nvmrc
    if test -n "$NVM_BIN" -a "$NVM_BIN" != "$HOME/.nvm/versions/node/$(nvm version default 2>/dev/null)/bin"
      echo "Reverting to default Node version"
      nvm use default
    end
  end
end