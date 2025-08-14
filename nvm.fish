# ~/.config/fish/functions/nvm.fish
# Fish wrapper for nvm using bass
function nvm --description 'Node Version Manager - Fish shell integration'
  # Ensure helper functions are available
  if not functions -q __nvm_check_setup
    if test -f /usr/share/fish/vendor_functions.d/bass_helper.fish
      source /usr/share/fish/vendor_functions.d/bass_helper.fish
    end
  end
  
  # Handle 'init' subcommand
  if test "$argv[1]" = "init"
    __nvm_run_setup
    return $status
  end
  
  # Check if nvm-fish is initialized
  if not __nvm_check_setup
    echo -e "\033[33mnvm-fish not initialized\033[0m"
    echo ""
    echo "Run: nvm init"
    echo ""
    return 1
  end
  
  # Ensure bass is available (quick check)
  if not __nvm_ensure_bass_quick
    echo -e "\033[31mBass not available\033[0m"
    echo "Try: nvm init"
    echo ""
    return 1
  end
  
  # Execute nvm command
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end