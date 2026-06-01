#!/bin/bash

# =============================================================================
# dot-vault: Universal Dotfile Backup & Restore (Dynamic & Clean)
# =============================================================================

# Clear screen immediately for a clean start
clear

set -e

# --- Configuration ---
BACKUP_DIR="$HOME/.dot-vault-backups"
MANIFEST_NAME="MANIFEST.txt"
CONFIG_BASES=(
    "$HOME/.config"
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
    "$HOME/.zshrc"
    "$HOME/.gitconfig"
    "$HOME/.vimrc"
    "$HOME/.tmux.conf"
    "$HOME/.p10k.zsh"
    "$HOME/.inputrc"
    "$HOME/.screenrc"
)

# --- Helper Functions ---
log_info() { echo "[INFO] $1"; }
log_error() { echo "[ERROR] $1"; exit 1; }
log_success() { echo "[SUCCESS] $1"; }

check_fzf() {
    if ! command -v fzf &> /dev/null; then
        log_error "fzf is required. Install it with: sudo pacman -S fzf"
        exit 1
    fi
}

# --- Step 1: Scan for Candidates ---
scan_candidates() {
    local candidates=()
    for base in "${CONFIG_BASES[@]}"; do
        if [[ -e "$base" ]]; then
            if [[ -d "$base" ]]; then
                candidates+=("$base")
            elif [[ -f "$base" ]]; then
                candidates+=("$base")
            fi
        fi
    done

    # Also scan common subfolders in .config if they exist
    if [[ -d "$HOME/.config" ]]; then
        for dir in "$HOME/.config"/*/; do
            [[ -d "$dir" ]] && candidates+=("$dir")
        done
    fi

    printf "%s\n" "${candidates[@]}"
}

# --- Step 2: Interactive Selection (Space to Select + Next) ---
select_files() {
    local candidates_str
    candidates_str=$(scan_candidates)

    if [[ -z "$candidates_str" ]]; then
        log_error "No configuration files or directories found!"
        exit 1
    fi

    # Use 'space:toggle+down' which is widely supported
    # --multi: Allow multiple selections
    local selected
    selected=$(echo "$candidates_str" | fzf \
        --height 70% \
        --multi \
        --border \
        --prompt="Select files/folders to BACKUP (Space to Select + Next):" \
        --header="↑/↓: Navigate | Space: Select/Next | Enter: Confirm" \
        --bind 'space:toggle+down' \
        --preview "tree -L 2 {} 2>/dev/null || ls -lh {} 2>/dev/null || head -10 {} 2>/dev/null || echo 'Cannot preview'"
        --preview-window "right:40%:wrap" \
        --layout=reverse \
    )

    if [[ -z "$selected" ]]; then
        log_info "No files selected. Exiting."
        exit 0
    fi

    echo "$selected"
}

# --- Step 3: Backup Logic ---
do_backup() {
    log_info "Scanning for configuration files..."

    # Get selection
    local selected_files
    selected_files=$(select_files)

    # Check if selection is empty (safety check)
    if [[ -z "$selected_files" ]]; then
        log_info "No files selected. Returning to menu."
        return
    fi

    # Create backup directory
    mkdir -p "$BACKUP_DIR"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local archive_name="dotfiles_backup_${timestamp}.tar.gz"
    local archive_path="$BACKUP_DIR/$archive_name"
    local temp_dir=$(mktemp -d)
    local manifest_path="$temp_dir/$MANIFEST_NAME"

    log_info "Preparing backup in temporary staging area..."

    # Create manifest and copy files
    while IFS= read -r file; do
        [[ -z "$file" ]] && continue
        [[ "$file" == \[* ]] && continue # Skip any log lines if accidentally captured

        local relative_path="${file#$HOME/}"
        local dest_path="$temp_dir/$relative_path"
        local dest_dir=$(dirname "$dest_path")

        mkdir -p "$dest_dir"

        if [[ -d "$file" ]]; then
            cp -r "$file" "$dest_path"
            log_info "  Backed up directory: $relative_path"
        else
            cp "$file" "$dest_path"
            log_info "  Backed up file: $relative_path"
        fi

        # Write to manifest
        echo "$relative_path" >> "$manifest_path"
    done <<< "$selected_files"

    # Create archive
    log_info "Creating archive: $archive_path"
    tar -czf "$archive_path" -C "$temp_dir" .

    # FIXED: Clean up temp dir FIRST
    rm -rf "$temp_dir"

    log_success "Backup created: $archive_path"
    echo ""
    echo "Manifest contents:"

    # FIXED: Extract manifest from the archive to show it
    local temp_extract=$(mktemp -d)
    tar -xzf "$archive_path" -C "$temp_extract"
    if [[ -f "$temp_extract/$MANIFEST_NAME" ]]; then
        cat "$temp_extract/$MANIFEST_NAME"
    fi
    rm -rf "$temp_extract"

    echo ""
    read -p "Press Enter to return to shell..."
}

# --- Step 4: Restore Logic ---
do_restore() {
    log_info "Scanning for backup archives..."

    # Find all tar.gz in standard locations
    local BACKUP_LIST=()
    local SEARCH_PATHS=("$HOME/.dot-vault-backups" "/mnt/nas" "/media")

    for path in "${SEARCH_PATHS[@]}"; do
        if [[ -d "$path" ]]; then
            while IFS= read -r -d '' file; do
                [[ "$file" == *.tar.gz ]] && BACKUP_LIST+=("$file")
            done < <(find "$path" -name "*.tar.gz" -type f -print0 2>/dev/null)
        fi
    done

    # Fallback: Manual browse if none found or user requests
    if [[ ${#BACKUP_LIST[@]} -eq 0 ]]; then
        log_info "No backups found in standard locations. Opening manual browser..."
        local selected
        selected=$(find / -maxdepth 6 -name "*.tar.gz" -type f 2>/dev/null | fzf \
            --height 60% --border --prompt="Select backup file manually: " \
            --preview "du -h {} | cut -f1"
        )
        if [[ -z "$selected" ]]; then exit 0; fi
        BACKUP_LIST=("$selected")
    fi

    # Select backup (Single select for restore source)
    local selected_archive
    selected_archive=$(printf "%s\n" "${BACKUP_LIST[@]}" | fzf \
        --height 60% --border --prompt="Select backup to restore: " \
        --preview "echo 'Archive: {}'; tar -tzf {} | head -20" \
        --preview-window "right:40%:wrap"
    )

    if [[ -z "$selected_archive" ]]; then
        log_info "No archive selected. Exiting."
        return
    fi

    log_info "Selected: $selected_archive"

    # Extract to temp
    local temp_extract=$(mktemp -d)
    tar -xzf "$selected_archive" -C "$temp_extract"

    # Check for manifest
    local manifest_file="$temp_extract/$MANIFEST_NAME"
    if [[ ! -f "$manifest_file" ]]; then
        log_error "No MANIFEST.txt found in this archive! Aborting."
        rm -rf "$temp_extract"
        return
    fi

    log_info "Reading manifest..."
    log_info "The following files will be restored:"
    cat "$manifest_file"
    echo ""

    # Confirm restore
    local response
    read -p "Do you want to proceed with restoring these files? (y/N): " response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        log_info "Restore cancelled."
        rm -rf "$temp_extract"
        return
    fi

    # Create safety backup of current files
    local safety_dir="$HOME/dotfiles_restore_safety_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$safety_dir"
    log_info "Backing up current files to: $safety_dir"

    # Restore loop
    while IFS= read -r relative_path; do
        [[ -z "$relative_path" ]] && continue

        local src_file="$temp_extract/$relative_path"
        local dest_file="$HOME/$relative_path"
        local dest_dir=$(dirname "$dest_file")

        if [[ -e "$dest_file" ]]; then
            # Backup current file
            mkdir -p "$safety_dir/$(dirname "$relative_path")"
            cp "$dest_file" "$safety_dir/$relative_path"
            log_info "  [OVERWRITE] Backed up current: $relative_path"
        else
            mkdir -p "$dest_dir"
        fi

        if [[ -d "$src_file" ]]; then
            rm -rf "$dest_file" # Remove old dir if exists
            cp -r "$src_file" "$dest_file"
            log_info "  [RESTORED] Directory: $relative_path"
        else
            cp "$src_file" "$dest_file"
            log_info "  [RESTORED] File: $relative_path"
        fi
    done < "$manifest_file"

    rm -rf "$temp_extract"

    log_success "Restore Complete!"
    echo ""
    echo "Safety backup created at: $safety_dir"
    echo "Restart your shell if needed."
    echo ""
    read -p "Press Enter to return to shell..."
}

# --- Main Menu ---
main_menu() {
    check_fzf

    local options=("Backup Configuration" "Restore Configuration" "Exit")
    local choice=$(printf "%s\n" "${options[@]}" | fzf \
        --height 40% --border --prompt="dot-vault (Universal Dotfiles)" \
        --header="Select an action" \
        --layout=reverse
    )

    case "$choice" in
        "Backup Configuration") do_backup ;;
        "Restore Configuration") do_restore ;;
        "Exit") log_info "Goodbye!"; exit 0 ;;
        *) log_error "Invalid choice" ;;
    esac
}

main_menu
