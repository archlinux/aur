# ~/.config/fish/functions/nvm_find_nvmrc.fish
# Find .nvmrc file in current or parent directories
function nvm_find_nvmrc --description 'Find .nvmrc file in current or parent directories'
  # Ensure helper functions are available
  if not functions -q __nvm_check_setup
    if test -f /usr/share/fish/vendor_functions.d/bass_helper.fish
      source /usr/share/fish/vendor_functions.d/bass_helper.fish
    end
  end
  
  # Check if nvm-fish is initialized
  if not __nvm_check_setup
    echo "❌ nvm-fish not initialized. Run: nvm init" >&2
    return 1
  end
  
  # Quick bass check
  if not __nvm_ensure_bass_quick
    echo "❌ Bass not available. Run: nvm init" >&2
    return 1
  end
  
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end