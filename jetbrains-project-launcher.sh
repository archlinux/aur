#!/bin/bash

# Configuration file path
CONFIG_FILE="$HOME/.config/jetbrains-project-launcher.conf"

# Declare variables for configuration
WATCH_DIRS=""
declare -A IDE_MAP

# Read the configuration file
while IFS= read -r line || [ -n "$line" ]; do
    # Skip comments and empty lines
    [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

    # Check for section headers
    if [[ "$line" =~ ^\[(.*)\]$ ]]; then
        CURRENT_SECTION="${BASH_REMATCH[1]}"
        continue
    fi

    # Parse key-value pairs
    if [[ "$line" =~ ^original_desktop_entry=(.*)$ ]]; then
        IDE_MAP["$CURRENT_SECTION"]="${BASH_REMATCH[1]}"
        WATCH_DIRS+="$HOME/$CURRENT_SECTION "
    fi
done < "$CONFIG_FILE"

# Trim trailing whitespace from WATCH_DIRS
WATCH_DIRS=$(echo "$WATCH_DIRS" | xargs)

# Function to generate desktop entries
generate_desktop_entry() {
    local desktop_entry_path="$1"
    local ide_dir="$2"
    local project="$3"
    local project_path="$4"

    local target_file="$HOME/.local/share/applications/jetbrains-project-launcher-$ide_dir-$project.desktop"

    # Check if desktop entry file exists
    if [[ ! -f "$desktop_entry_path" ]]; then
        echo "Error: Desktop entry file '$desktop_entry_path' not found. Skipping..."
        return
    fi

    # Create the new desktop entry
    cp "$desktop_entry_path" "$target_file"
    sed -i "s|Exec=\(.*\) %u|Exec=\1 $project_path %u|" "$target_file"
    sed -i "s|^Name=.*|Name=$project|" "$target_file"
    sed -i "s|^Comment=.*|Comment=Open $project in $ide_dir|" "$target_file"
    echo "Keywords=$ide_dir;$project;project" >> "$target_file"

    echo "Created desktop entry for $project in $ide_dir."
}

# Clear existing desktop entries
rm -f "$HOME/.local/share/applications/jetbrains-project-launcher-*.desktop"

# Process directories to generate desktop entries
for dir in $WATCH_DIRS; do
    [[ ! -d "$dir" ]] && echo "Warning: Directory '$dir' not found. Skipping..." && continue

    for subdir in "$dir"/*; do
        if [[ -d "$subdir" ]]; then
            IDE_DIR=$(basename "$(dirname "$subdir")")
            PROJECT=$(basename "$subdir")
            DESKTOP_ENTRY="${IDE_MAP[$IDE_DIR]}"
            PROJECT_PATH="$subdir"

            generate_desktop_entry "$DESKTOP_ENTRY" "$IDE_DIR" "$PROJECT" "$PROJECT_PATH"
        fi
    done
done

# Monitor directories for changes
inotifywait -me create,delete,moved_to,moved_from --format '%w%f %e' $WATCH_DIRS | while read DIR EVENT; do
    IDE_DIR=$(basename "$(dirname "$DIR")")
    PROJECT=$(basename "$DIR")

    if [[ -d "$DIR" && ( "$EVENT" == *CREATE* || "$EVENT" == *MOVED_TO* ) ]]; then
        echo "Creating desktop entry for $PROJECT in $IDE_DIR"
        DESKTOP_ENTRY="${IDE_MAP[$IDE_DIR]}"
        generate_desktop_entry "$DESKTOP_ENTRY" "$IDE_DIR" "$PROJECT" "$DIR"
    elif [[ "$EVENT" == *DELETE* || "$EVENT" == *MOVED_FROM* ]]; then
        echo "Deleting desktop entry for $PROJECT in $IDE_DIR"
        rm -f "$HOME/.local/share/applications/jetbrains-project-launcher-$IDE_DIR-$PROJECT.desktop"
    fi
done