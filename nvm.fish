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
    echo -e " \033[33mnvm-fish not initialized\033[0m"
    echo ""
    echo "Run: nvm init"
    echo ""
    return 1
  end
  
  # Ensure bass is available (quick check)
  if not __nvm_ensure_bass_quick
    echo -e " \033[31mBass not available\033[0m"
    echo "Try: nvm init"
    echo ""
    return 1
  end
  
  # Handle nvm use command with .nvmrc management
  if test "$argv[1]" = "use"; and test (count $argv) -gt 1
    # Execute nvm use command and capture output
    set -l nvm_output (bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv 2>&1)

    # Display nvm output to user
    if test -n "$nvm_output"
      echo "$nvm_output"
    end

    # Check if nvm use command succeeded
    if test $status -eq 0
      # Extract version from nvm output (e.g., "Now using node v18.17.0 (npm v9.6.7)")
      set -l node_current_version (string match -rg 'Now using node v([0-9]+\.[0-9]+\.[0-9]+)' "$nvm_output")

      # Handle .nvmrc file creation/management if we got a valid version
      if test -n "$node_current_version"
        # Validate that node_current_version matches semantic versioning (e.g., X.Y.Z)
        if string match -rq '^[0-9]+\.[0-9]+\.[0-9]+.*$' -- "$node_current_version"
          # Only prompt for .nvmrc management if this is a manual user invocation
          # Check if we're being called automatically (from load_nvm) or directly by user
          # Use NVM_AUTO environment variable to indicate automatic invocation
          if not set -q NVM_AUTO
            __nvm_handle_nvmrc_file "$node_current_version"
          end
        else
          echo -e " \033[31m⚠ Warning: Unexpected Node.js version format: '$node_current_version'\033[0m"
          echo -e " \033[31m   Expected format: X.Y.Z (e.g., 18.17.0)\033[0m"
        end
      else
        echo -e " \033[31m⚠ Warning: Failed to extract Node.js version from nvm output\033[0m"
        echo -e " \033[31m   Expected output format: 'Now using node v<version>'\033[0m"
      end
    else
      echo -e " \033[31m✘ Failed to switch Node version\033[0m"
      return 1
    end

    # Return to avoid executing the command twice
    return
  end

  # Execute nvm command for other cases
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Helper function to create .nvmrc file with error handling
function __nvm_write_nvmrc_file --description "Write version to .nvmrc file with error handling"
  set -l node_version "$argv[1]"

  if echo "$node_version" > "$PWD/.nvmrc" 2>/dev/null
    echo -e " \033[32m✔ Created .nvmrc with version $node_version\033[0m"
    return 0
  else
    echo -e " \033[31m✘ Failed to create .nvmrc file\033[0m"
    return 1
  end
end

# Handle .nvmrc file creation/management
function __nvm_handle_nvmrc_file --description "Handle .nvmrc file creation or override"
  set -l target_version "$argv[1]"

  if not test -f "$PWD/.nvmrc"
    # No .nvmrc exists, create new one
    __nvm_create_nvmrc "$target_version"
  else
    # .nvmrc exists, check if version is different
    set -l existing_version (string trim < "$PWD/.nvmrc")
    if test "$existing_version" != "$target_version"
      __nvm_prompt_override_nvmrc "$existing_version" "$target_version"
    end
  end
end

# Create new .nvmrc file
function __nvm_create_nvmrc --description "Create new .nvmrc file"
  set -l node_version "$argv[1]"

  echo -e " \033[33m🔎 No .nvmrc file found in current directory.\033[0m"

  # Use stty to handle input without read> prompt
  if not set -l old_stty (stty -g 2>/dev/null)
    echo -e " \033[31m⚠ Failed to save terminal settings\033[0m"
    return 1
  end
  stty -icanon -echo 2>/dev/null

  echo -n -e "    Would you like to create one with \033[1;36mNode v$node_version\033[0;22m for automatic switching? [Y/n] "
  set -l response (head -c 1)
  echo ""

  stty $old_stty

  switch "$response"
    case n N
      echo -e " \033[90m• Skipped .nvmrc creation\033[0m"
      return 1
    case "" y Y
      __nvm_write_nvmrc_file "$node_version"
      return 0
    case '*'
      echo -e " \033[33m⚠  Unrecognized input '$response'. Defaulting to 'Yes'.\033[0m"
      __nvm_write_nvmrc_file "$node_version"
      return 0
  end
end

# Prompt user for .nvmrc override
function __nvm_prompt_override_nvmrc --description "Prompt user to override existing .nvmrc"
  set -l existing_version "$argv[1]"
  set -l target_version "$argv[2]"

  echo -e " \033[33m✒  .nvmrc already exists in current directory.\033[0m"
  echo -e " \033[33m   Current version: $existing_version\033[0m"
  echo -e " \033[33m   Target version:  $target_version\033[0m"
  echo ""
  echo -e " \033[36mWhat would you like to do?\033[0m"
  echo -e " \033[36m  1) Keep existing .nvmrc\033[0m"
  echo -e " \033[36m  2) Override with backup\033[0m"
  echo -e " \033[36m  3) Override without backup\033[0m"

  # Use stty to handle input without read> prompt
  if not set -l old_stty (stty -g 2>/dev/null)
    echo -e " \033[31m⚠ Failed to save terminal settings\033[0m"
    return 1
  end
  stty -icanon -echo 2>/dev/null

  echo -n -e " \033[36m   [1/2/3] \033[0m"
  set -l response (head -c 1)
  echo ""

  stty $old_stty

  switch "$response"
    case '2'
      if __nvm_backup_nvmrc
        # Backup successful, now attempt override
        if echo "$target_version" > "$PWD/.nvmrc" 2>/dev/null
          echo -e " \033[32m✔ Overridden .nvmrc with version $target_version (backup saved)\033[0m"
        else
          echo -e " \033[31m✘ Backup succeeded but failed to override .nvmrc file\033[0m"
        end
      else
        # Backup failed, ask if user wants to override without backup
        echo -e " \033[33m⚠ Backup failed, but you can still override.\033[0m"

        # Use stty for second input
        if not set -l old_stty2 (stty -g 2>/dev/null)
          echo -e " \033[31m⚠ Failed to save terminal settings\033[0m"
          return 1
        end
        stty -icanon -echo 2>/dev/null

        echo -n -e " \033[36m   Override anyway? [y/N] \033[0m"
        set -l backup_fail_response (head -c 1)
        echo ""

        stty $old_stty2

        if test "$backup_fail_response" = "y" -or "$backup_fail_response" = "Y"
          if echo "$target_version" > "$PWD/.nvmrc" 2>/dev/null
            echo -e " \033[32m✔ Overridden .nvmrc with version $target_version\033[0m"
          else
            echo -e " \033[31m✘ Failed to override .nvmrc file\033[0m"
          end
        else
          echo -e " \033[90m• Kept existing .nvmrc\033[0m"
        end
      end
    case '3'
      if echo "$target_version" > "$PWD/.nvmrc" 2>/dev/null
        echo -e " \033[32m✔ Overridden .nvmrc with version $target_version\033[0m"
      else
        echo -e " \033[31m✘ Failed to override .nvmrc file\033[0m"
      end
    case '*'
      echo -e " \033[90m• Kept existing .nvmrc\033[0m"
  end
end

# Backup existing .nvmrc file
function __nvm_backup_nvmrc --description "Backup existing .nvmrc file"
  # Create .nvm directory if it doesn't exist
  if not test -d "$PWD/.nvm"
    if not mkdir -p "$PWD/.nvm" 2>/dev/null
      echo -e " \033[31m✘ Failed to create .nvm directory\033[0m"
      return 1
    end
  end

  # Generate timestamp backup filename
  set -l timestamp (date "+%Y_%m_%d_%H%M%S")
  set -l backup_file "$PWD/.nvm/.nvmrc_$timestamp"

  # Copy existing .nvmrc to backup with better error handling
  if cp "$PWD/.nvmrc" "$backup_file" 2>/dev/null
    return 0
  else
    echo -e " \033[31m✘ Failed to create backup\033[0m"
    echo -e " \033[33m   Possible causes: permission denied, disk full, or file system read-only\033[0m"
    echo -e " \033[33m   Backup path: $backup_file\033[0m"
    return 1
  end
end