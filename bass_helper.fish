# bass_helper.fish - Intelligent bass environment management and auto-configuration

function __nvm_setup_bass --description 'Setup bass environment for nvm integration'
    # Check if bass is already available
    if command -v bass >/dev/null 2>&1
        return 0
    end

    echo "Checking bass installation options..."
    
    # Check plugin managers and show status
    echo -n "  fisher: "
    if command -v fisher >/dev/null 2>&1
        echo -e "\033[32m✓\033[0m"
        echo "Installing bass via fisher..."
        # Show fisher output
        fisher install edc/bass
        if test $status -eq 0
            echo -e "\033[32mBass installed successfully via fisher\033[0m"
            echo "Please restart your fish shell to complete setup"
            return 0
        else
            echo -e "\033[31mFailed to install via fisher\033[0m"
        end
    else
        echo -e "\033[90m✗\033[0m"
    end
    
    echo -n "  omf: "
    if command -v omf >/dev/null 2>&1
        echo -e "\033[32m✓\033[0m"
        echo "Installing bass via Oh My Fish..."
        # Show OMF output
        omf install bass
        if test $status -eq 0
            echo -e "\033[32mBass installed successfully via OMF\033[0m"
            echo "Please restart your fish shell to complete setup"
            return 0
        else
            echo -e "\033[31mFailed to install via OMF\033[0m"
        end
    else
        echo -e "\033[90m✗\033[0m"
    end
    
    echo -n "  fundle: "
    if functions -q fundle >/dev/null 2>&1
        echo -e "\033[32m✓\033[0m"
        echo "Installing bass via fundle..."
        # Show fundle output
        fundle plugin 'edc/bass'
        fundle install
        if test $status -eq 0
            echo -e "\033[32mBass installed successfully via fundle\033[0m"
            echo "Please restart your fish shell to complete setup"
            return 0
        else
            echo -e "\033[31mFailed to install via fundle\033[0m"
        end
    else
        echo -e "\033[90m✗\033[0m"
    end

    # No plugin manager available - compile from source
    echo ""
    echo "No plugin managers detected, will compile bass from source..."
    
    set -l fish_functions_dir "$HOME/.config/fish/functions"
    
    echo -n "Downloading bass source code... "
    # Show download with progress
    if curl -L --progress-bar --fail https://github.com/edc/bass/archive/master.tar.gz -o /tmp/bass.tar.gz
        echo -e "\033[32m✓\033[0m"
    else
        echo -e "\033[31m✗\033[0m"
        echo -e "\033[31mDownload failed\033[0m"
        return 1
    end
    
    echo -n "Extracting source... "
    # Show extraction process
    if tar -xzf /tmp/bass.tar.gz -C /tmp 2>/dev/null
        echo -e "\033[32m✓\033[0m"
    else
        echo -e "\033[31m✗\033[0m"
        echo -e "\033[31mExtraction failed\033[0m"
        rm -f /tmp/bass.tar.gz
        return 1
    end
    
    echo "Installing bass functions..."
    mkdir -p "$fish_functions_dir"
    if test -f "/tmp/bass-master/functions/bass.fish"
        cp /tmp/bass-master/functions/* "$fish_functions_dir/"
        source "$fish_functions_dir/bass.fish"
        
        # Create uninstall script
        set -l uninstall_script "$HOME/.local/bin/uninstall-bass-nvm-fish.sh"
        mkdir -p (dirname "$uninstall_script")
        echo "#!/bin/bash" > "$uninstall_script"
        echo "rm -f '$fish_functions_dir/bass.fish' '$fish_functions_dir/__bass.py'" >> "$uninstall_script"
        echo "rm -f '$uninstall_script'" >> "$uninstall_script"
        chmod +x "$uninstall_script"
        
        echo -e "\033[32mBass compiled and installed successfully\033[0m"
        echo "Installation path: $fish_functions_dir"
        echo "Uninstall script: $uninstall_script"
    else
        echo -e "\033[31mBass source files not found\033[0m"
        rm -rf /tmp/bass-master /tmp/bass.tar.gz
        return 1
    end
    
    # Clean up
    rm -rf /tmp/bass-master /tmp/bass.tar.gz
    
    return 0
end

# Auto-configure Fish shell integration
function __nvm_auto_configure_fish --description 'Configure Fish shell for nvm integration'
    set -l fish_config_file "$HOME/.config/fish/config.fish"
    
    # Check if already configured
    if test -f "$fish_config_file" && grep -q "load_nvm" "$fish_config_file"
        return 0
    end
    
    echo "Configuring Fish shell integration..."
    
    # Create fish config directory if it doesn't exist
    mkdir -p "$HOME/.config/fish"
    
    # Clean any previous nvm-fish entries first
    sed -i '/load_nvm/d;/nvm-fish integration/d' "$fish_config_file" 2>/dev/null || true
    
    # Add to config.fish with clear markers
    echo "" >> "$fish_config_file"
    echo "# nvm-fish integration - added automatically" >> "$fish_config_file"
    echo "# You must call it on initialization or directory switching won't work" >> "$fish_config_file"
    echo "load_nvm > /dev/stderr" >> "$fish_config_file"
    
    echo -e "\033[32mFish integration configured\033[0m"
    
    # Load immediately for current session
    load_nvm > /dev/stderr
end

# Check if nvm-fish is properly initialized
function __nvm_check_setup --description 'Check if nvm-fish is initialized'
    set -l setup_marker_file "$HOME/.config/nvm-fish-setup-done"
    
    # Check marker file exists
    if not test -f "$setup_marker_file"
        return 1
    end
    
    # Quick check if bass is available
    if command -v bass >/dev/null 2>&1
        return 0
    end
    
    # Check if bass.fish exists and source it immediately
    if test -f "$HOME/.config/fish/functions/bass.fish"
        source "$HOME/.config/fish/functions/bass.fish" 2>/dev/null
        # After sourcing, consider it available
        return 0
    end
    
    return 1
end

# Quick bass availability check (no setup attempt)
function __nvm_ensure_bass_quick --description 'Quick check if bass is available'
    # Check if bass command is available
    if command -v bass >/dev/null 2>&1
        return 0
    end
    
    # Check if bass.fish exists and source it immediately
    if test -f "$HOME/.config/fish/functions/bass.fish"
        source "$HOME/.config/fish/functions/bass.fish" 2>/dev/null
        # After sourcing, bass should be available - don't rely on command -v again
        return 0
    end
    
    return 1
end

# Run complete setup (for nvm init)
function __nvm_run_setup --description 'Run complete nvm-fish setup'
    set -l setup_marker_file "$HOME/.config/nvm-fish-setup-done"
    
    echo "Initializing nvm-fish..."
    echo ""
    
    # Setup bass environment
    if not __nvm_ensure_bass
        echo -e "\033[31mSetup failed\033[0m"
        return 1
    end
    
    echo ""
    
    # Configure Fish shell integration
    __nvm_auto_configure_fish
    
    # Create marker file to indicate setup is complete
    touch "$setup_marker_file"
    
    echo ""
    echo -e "\033[32mSetup complete!\033[0m"
    echo ""
    echo "Available features:"
    echo "  • All nvm commands work in Fish shell"
    echo "  • Automatic .nvmrc version switching"  
    echo "  • Bass integration for bash compatibility"
    echo ""
    echo "Try: nvm --version"
    
    return 0
end

# Ensure bass environment is available
function __nvm_ensure_bass --description 'Ensure bass is available for nvm commands'
    # First check if bass command is available
    if command -v bass >/dev/null 2>&1
        return 0
    end
    
    # Check if bass.fish file exists (means it's installed)
    if test -f "$HOME/.config/fish/functions/bass.fish"
        # Source it to make it available in current session
        source "$HOME/.config/fish/functions/bass.fish" 2>/dev/null
        return 0
    end
    
    # If bass file doesn't exist, try to install it
    __nvm_setup_bass
    
    # Final check - if bass.fish exists after installation, source it
    if test -f "$HOME/.config/fish/functions/bass.fish"
        source "$HOME/.config/fish/functions/bass.fish" 2>/dev/null
        return 0
    end
    
    # Installation failed
    echo -e "\033[31mBass setup failed\033[0m"
    echo ""
    echo "Possible causes:"
    echo "  • Network connection issues"
    echo "  • Missing dependencies"
    echo ""
    echo "Try restarting fish shell: exec fish"
    echo ""
    return 1
end