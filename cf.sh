#!/bin/sh

VERSION="1.0.1"

# -------- CONFIG --------
# Locate user config file (search multiple paths)
if [ -f "${HOME}/.config/cf/config.ini" ]; then
    CONFIG_FILE="${HOME}/.config/cf/config.ini"
elif [ -f "/etc/easy-config/config.ini" ]; then
    CONFIG_FILE="/etc/easy-config/config.ini"
elif [ -f "./config.ini" ]; then
    CONFIG_FILE="./config.ini"
else
    CONFIG_FILE="${HOME}/.config/cf/config.ini"
fi

CACHE_FILE="${HOME}/.config/cf/cache.ini"
# Locate default config file
if [ -f "${HOME}/.config/cf/config.ini.default" ]; then
    DEFAULT_CONFIG="${HOME}/.config/cf/config.ini.default"
elif [ -f "/usr/share/easy-config/config.ini.default" ]; then
    DEFAULT_CONFIG="/usr/share/easy-config/config.ini.default"
elif [ -f "./config.ini.default" ]; then
    DEFAULT_CONFIG="./config.ini.default"
else
    DEFAULT_CONFIG="${HOME}/.config/cf/config.ini.default"
fi

# default settings
SMART_SEARCH=true
CONFIG_PATH="${HOME}/.config"
MAX_RESULTS=20
USE_FZF=true
DEFAULT_EDITOR_FILE="${EDITOR:-nano}"
DEFAULT_EDITOR_FOLDER="${EDITOR:-code}"
AUTO_SELECT=false

# -------- UTILITIES --------
# POSIX-compatible trim function (no 'local' keyword)
trim() {
    _trim_var="$1"
    _trim_var="${_trim_var#"${_trim_var%%[![:space:]]*}"}"
    _trim_var="${_trim_var%"${_trim_var##*[![:space:]]}"}"
    printf '%s' "$_trim_var"
}

# Print error messages to stderr
err() {
    printf 'cf: %s\n' "$*" >&2
}

# Expand ~ to $HOME
expand_tilde() {
    printf '%s' "$1" | sed "s|^~|$HOME|"
}

# -------- HELP --------
show_help() {
    cat << EOF
EasyConfig $VERSION

Usage: cf [OPTIONS] <name> [editor]

Arguments:
  <name>     Name or path of config file to edit
  [editor]   Override default editor

Options:
  --help                  Show this help message
  --version               Show version
  --list                  List all configured targets
  --config restore        Restore all default settings
  --config restore SECTION
                          Restore specific section (settings/targets/aliases)

Examples:
  cf nvim                 # Edit neovim config
  cf cf                   # Edit cf config
  cf fish code            # Edit fish config with code
  cf kitty cat            # Print kitty config with cat
  cf --list               # Show all targets
  cf --config restore     # Restore whole config
  cf --config restore settings
                          # Restore only settings section
EOF
}

# -------- LIST TARGETS --------
list_targets() {
    if [ ! -f "$CONFIG_FILE" ]; then
        err "No config file found"
        return 1
    fi

    printf 'Configured targets:\n'
    in_targets=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[targets]") in_targets=1; continue ;;
            "["*"]") in_targets=0 ;;
        esac

        if [ $in_targets -eq 1 ] && [ -n "$line" ]; then
            _key="${line%%=*}"
            _val="${line#*=}"
            _key=$(trim "$_key")
            _val=$(trim "$_val")
            [ -n "$_key" ] && printf '  %-16s -> %s\n' "$_key" "$_val"
        fi
    done < "$CONFIG_FILE"

    printf '\nAliases:\n'
    in_alias=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[aliases]") in_alias=1; continue ;;
            "["*"]") in_alias=0 ;;
        esac

        if [ $in_alias -eq 1 ] && [ -n "$line" ]; then
            _key="${line%%=*}"
            _val="${line#*=}"
            _key=$(trim "$_key")
            _val=$(trim "$_val")
            [ -n "$_key" ] && printf '  %-16s -> [%s]\n' "$_key" "$_val"
        fi
    done < "$CONFIG_FILE"
}

# -------- RESTORE DEFAULTS --------
reset_defaults() {
    section="$1"
    # Always write to user's local config (editable copy)
    user_config_file="${HOME}/.config/cf/config.ini"
    config_dir="$(dirname "$user_config_file")"

    mkdir -p "$config_dir"

    # Ensure default config exists in system location
    if [ ! -f "$DEFAULT_CONFIG" ]; then
        err "Default config not found at $DEFAULT_CONFIG"
        err "Please ensure config.ini.default is installed"
        return 1
    fi

    if [ -z "$section" ]; then
        # restore whole file
        cp "$DEFAULT_CONFIG" "$user_config_file"
        echo "Restored all default settings"
        return 0
    fi

    # restore specific section
    case "$section" in
        settings|targets|aliases)
            # backup current file if exists
            if [ -f "$user_config_file" ]; then
                cp "$user_config_file" "$user_config_file.bak"
                # Build new config by replacing just the requested section
                _rebuild_config "$section" "$user_config_file" "$DEFAULT_CONFIG"
                echo "Restored [$section] section (backup at config.ini.bak)"
            else
                cp "$DEFAULT_CONFIG" "$user_config_file"
                echo "No existing config found; copied defaults"
            fi
            ;;
        *)
            err "Unknown section: $section"
            err "Valid sections: settings, targets, aliases"
            return 1
            ;;
    esac
}

# Rebuild config by replacing a specific section from defaults
_rebuild_config() {
    _section="$1"
    _current="$2"
    _defaults="$3"
    _tmpfile="${_current}.new"

    # Extract the default section content
    _default_section=$(sed -n "/^\\[${_section}\\]/,/^\\[/p" "$_defaults" | sed '${ /^\[/d }')

    # Build the new file: copy everything except the target section, insert default section
    _in_skip=0
    _inserted=0
    : > "$_tmpfile"

    while IFS= read -r _line || [ -n "$_line" ]; do
        case "$_line" in
            "[$_section]"*)
                # Insert the default section here
                printf '%s\n' "$_default_section" >> "$_tmpfile"
                _in_skip=1
                _inserted=1
                ;;
            "["*"]"*)
                if [ $_in_skip -eq 1 ]; then
                    _in_skip=0
                    printf '%s\n' "$_line" >> "$_tmpfile"
                else
                    printf '%s\n' "$_line" >> "$_tmpfile"
                fi
                ;;
            *)
                if [ $_in_skip -eq 0 ]; then
                    printf '%s\n' "$_line" >> "$_tmpfile"
                fi
                ;;
        esac
    done < "$_current"

    # If section wasn't found in current file, append it
    if [ $_inserted -eq 0 ]; then
        printf '\n%s\n' "$_default_section" >> "$_tmpfile"
    fi

    mv "$_tmpfile" "$_current"
}

# -------- LOAD CONFIG --------
load_config() {
    [ ! -f "$CONFIG_FILE" ] && return

    in_settings=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[settings]") in_settings=1; continue ;;
            "["*"]") in_settings=0 ;;
        esac

        if [ $in_settings -eq 1 ]; then
            _key="${line%%=*}"
            _val="${line#*=}"
            _key=$(trim "$_key")
            _val=$(trim "$_val")

            case "$_key" in
                default_editor_file)     [ -n "$_val" ] && DEFAULT_EDITOR_FILE="$_val" ;;
                default_editor_folder)   [ -n "$_val" ] && DEFAULT_EDITOR_FOLDER="$_val" ;;
                smart_search)            SMART_SEARCH="$_val" ;;
                config_path)             CONFIG_PATH="$_val" ;;
                use_fzf)                 USE_FZF="$_val" ;;
                max_results)             MAX_RESULTS="$_val" ;;
                auto_select_first_found_item) AUTO_SELECT="$_val" ;;
            esac
        fi
    done < "$CONFIG_FILE"
}

# -------- PARSE TARGETS --------
get_target() {
    key="$1"

    # 1. check cache
    if [ -f "$CACHE_FILE" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            case "$line" in
                "${key}="*)
                    value="${line#*=}"
                    trim "$value"
                    return 0
                    ;;
            esac
        done < "$CACHE_FILE"
    fi

    # 2. check targets
    in_targets=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[targets]") in_targets=1; continue ;;
            "["*"]") in_targets=0 ;;
        esac

        if [ $in_targets -eq 1 ] && [ -n "$line" ]; then
            case "$line" in
                "["*"]") ;;  # skip section headers
                *)
                    _tkey="${line%%=*}"
                    _tkey=$(trim "$_tkey")
                    if [ "$_tkey" = "$key" ]; then
                        value="${line#*=}"
                        trim "$value"
                        return 0
                    fi
                    ;;
            esac
        fi
    done < "$CONFIG_FILE"

    # 3. check aliases
    in_alias=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[aliases]") in_alias=1; continue ;;
            "["*"]") in_alias=0 ;;
        esac

        if [ $in_alias -eq 1 ] && [ -n "$line" ]; then
            target_name="${line%%=*}"
            shortcuts="${line#*=}"
            target_name=$(trim "$target_name")
            shortcuts=$(trim "$shortcuts")

            # Check if key matches any of the comma-separated shortcuts
            # Using grep -F for literal matching (no regex injection)
            if printf ',%s,' "$shortcuts" | grep -Fq ",$key,"; then
                get_target "$target_name"
                return $?
            fi
        fi
    done < "$CONFIG_FILE"

    return 1
}

# -------- SEARCH --------
smart_search() {
    query="$1"

    search_path=$(expand_tilde "$CONFIG_PATH")

    if [ ! -d "$search_path" ]; then
        err "Search path does not exist: $search_path"
        return 1
    fi

    # If query looks like a path (contains /), check if it exists directly under config_path
    case "$query" in
        */*)
            direct_path="$search_path/$query"
            if [ -e "$direct_path" ]; then
                printf '%s' "$direct_path"
                return 0
            fi
            ;;
    esac

    # Search: use full-path matching (-p) when query contains /
    case "$query" in
        */*)
            if command -v fd > /dev/null 2>&1; then
                results=$(fd -HI -p "$query" "$search_path" 2>/dev/null | head -n "$MAX_RESULTS")
            else
                results=$(find "$search_path" -ipath "*$query*" 2>/dev/null | head -n "$MAX_RESULTS")
            fi
            ;;
        *)
            if command -v fd > /dev/null 2>&1; then
                results=$(fd -HI "$query" "$search_path" 2>/dev/null | head -n "$MAX_RESULTS")
            else
                results=$(find "$search_path" -iname "*$query*" 2>/dev/null | head -n "$MAX_RESULTS")
            fi
            ;;
    esac

    # Count non-empty lines
    if [ -z "$results" ]; then
        err "No results found for '$query'"
        return 1
    fi

    count=$(printf '%s\n' "$results" | wc -l)

    if [ "$count" -eq 1 ]; then
        printf '%s' "$results"
        return 0
    fi

    if [ "$AUTO_SELECT" = "true" ]; then
        printf '%s' "$results" | head -1
        return 0
    fi

    printf '%s results found:\n' "$count" >&2

    if [ "$USE_FZF" = "true" ] && command -v fzf > /dev/null 2>&1; then
        selected=$(printf '%s\n' "$results" | fzf)
        if [ -n "$selected" ]; then
            printf '%s' "$selected"
            return 0
        fi
        return 1
    fi

    # Numbered selection fallback (using here-doc to avoid subshell)
    i=1
    while IFS= read -r result; do
        printf '%d) %s\n' "$i" "$result" >&2
        i=$((i + 1))
    done <<EOF
$results
EOF

    printf 'Select 1-%s: ' "$count" >&2
    read choice < /dev/tty

    # Validate input
    case "$choice" in
        ''|*[!0-9]*)
            err "Invalid selection"
            return 1
            ;;
    esac

    if [ "$choice" -lt 1 ] || [ "$choice" -gt "$count" ]; then
        err "Selection out of range (1-$count)"
        return 1
    fi

    printf '%s\n' "$results" | sed -n "${choice}p"
}

# -------- CACHE --------
save_cache() {
    key="$1"
    path="$2"

    mkdir -p "$(dirname "$CACHE_FILE")"

    # Remove old entry if present, then append new
    if [ -f "$CACHE_FILE" ]; then
        grep -Fv "${key}=" "$CACHE_FILE" > "$CACHE_FILE.tmp" 2>/dev/null || : > "$CACHE_FILE.tmp"
        mv "$CACHE_FILE.tmp" "$CACHE_FILE"
    fi

    printf '%s=%s\n' "$key" "$path" >> "$CACHE_FILE"
}

# -------- PICK EDITOR --------
pick_editor() {
    target="$1"
    override_editor="$2"

    # if override editor provided, use it
    if [ -n "$override_editor" ]; then
        printf '%s' "$override_editor"
        return 0
    fi

    # check if target ends with /* (indicates folder) or is a directory
    case "$target" in
        */\*) printf '%s' "$DEFAULT_EDITOR_FOLDER" ;;
        *)
            if [ -d "$(expand_tilde "$target")" ]; then
                printf '%s' "$DEFAULT_EDITOR_FOLDER"
            else
                printf '%s' "$DEFAULT_EDITOR_FILE"
            fi
            ;;
    esac
}

# -------- INITIALIZE USER CONFIG --------
init_user_config() {
    user_config_file="${HOME}/.config/cf/config.ini"
    config_dir="$(dirname "$user_config_file")"

    mkdir -p "$config_dir"

    # If user config doesn't exist, copy from system config
    if [ ! -f "$user_config_file" ]; then
        if [ -f "/etc/easy-config/config.ini" ]; then
            cp "/etc/easy-config/config.ini" "$user_config_file"
        elif [ -f "$DEFAULT_CONFIG" ]; then
            cp "$DEFAULT_CONFIG" "$user_config_file"
        fi
    fi
}

# -------- MAIN --------
cf() {
    # Check for help/version flags first
    if [ $# -lt 1 ]; then
        show_help
        return 1
    fi

    case "$1" in
        --help)
            show_help
            return 0
            ;;
        --version)
            echo "cf version $VERSION"
            return 0
            ;;
        --list)
            init_user_config
            load_config
            list_targets
            return $?
            ;;
        --config)
            if [ "$2" = "restore" ]; then
                reset_defaults "$3"
                return $?
            else
                err "Unknown config command: $2"
                err "Use 'cf --config restore [SECTION]'"
                return 1
            fi
            ;;
    esac

    # First run: ensure user config exists
    init_user_config

    load_config

    name="$1"
    override_editor="$2"

    target=$(get_target "$name")

    # fallback search
    if [ -z "$target" ] && [ "$SMART_SEARCH" = "true" ]; then
        target=$(smart_search "$name")
        if [ -z "$target" ]; then
            return 1
        fi
        save_cache "$name" "$target"
    fi

    if [ -z "$target" ]; then
        err "Target '$name' not found"
        return 1
    fi

    # expand ~
    target=$(expand_tilde "$target")

    editor=$(pick_editor "$target" "$override_editor")

    # Verify editor exists
    if ! command -v "$editor" > /dev/null 2>&1; then
        err "Editor '$editor' not found in PATH"
        return 1
    fi

    # strip /* suffix if present (only when it ends with /*)
    case "$target" in
        */\*) target="${target%/*}" ;;
    esac

    # Determine what we're opening
    if [ -d "$target" ]; then
        target_type="(folder)"
    elif [ -f "$target" ]; then
        target_type="(file)"
    else
        err "Warning: '$target' does not exist"
        target_type="(unknown)"
    fi

    echo "Opening $target_type in $editor: $target"
    $editor "$target"
}

# Call the function with arguments
cf "$@"
