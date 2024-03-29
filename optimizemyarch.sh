#!/bin/bash

# Configuration file path
config_file="$HOME/.config/oma/.config"

# Source other script files
source init.sh
source dependencies.sh
source optimizations.sh
source options.sh

load_config() {
    source "$config_file"
}
# Main function
main() {
    # Check if configuration file exists
    if [ ! -f "$config_file" ]; then
        display_init_prompt
    fi

    # Load configuration
    load_config

    # Process command-line options
    process_options "$@"
}

# Execute main function with command-line arguments
main "$@"
