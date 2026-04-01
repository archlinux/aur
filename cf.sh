#!/bin/sh

VERSION="1.0.2"

if [ -f "${HOME}/.config/easy-config/config.conf" ]; then
    CONFIG_FILE="${HOME}/.config/easy-config/config.conf"
elif [ -f "${HOME}/.config/easy-config/config.ini" ]; then
    CONFIG_FILE="${HOME}/.config/easy-config/config.ini"
elif [ -f "/etc/easy-config/config.conf" ]; then
    CONFIG_FILE="/etc/easy-config/config.conf"
elif [ -f "./config.conf" ]; then
    CONFIG_FILE="./config.conf"
else
    CONFIG_FILE=""
fi

if [ -f "${HOME}/.config/easy-config/config.conf.default" ]; then
    DEFAULT_CONFIG="${HOME}/.config/easy-config/config.conf.default"
elif [ -f "/usr/share/easy-config/config.conf.default" ]; then
    DEFAULT_CONFIG="/usr/share/easy-config/config.conf.default"
elif [ -f "./config.conf.default" ]; then
    DEFAULT_CONFIG="./config.conf.default"
else
    DEFAULT_CONFIG="${HOME}/.config/easy-config/config.conf.default"
fi

SMART_SEARCH=true
CONFIG_PATH="${HOME}/.config"
ROOT_CONFIG_PATH="/etc"
MAX_RESULTS=20
USE_FZF=true
DEFAULT_EDITOR_FILE="${EDITOR:-nano}"
DEFAULT_EDITOR_FOLDER="${EDITOR:-code}"
AUTO_SELECT=false

CACHE_ENABLED=true
CACHE_FILE="${HOME}/.config/easy-config/cache.conf"

trim() {
    _trim_var="$1"
    _trim_var="${_trim_var#"${_trim_var%%[![:space:]]*}"}"
    _trim_var="${_trim_var%"${_trim_var##*[![:space:]]}"}"
    printf '%s' "$_trim_var"
}

err() {
    printf 'cf: %s\n' "$*" >&2
}

expand_tilde() {
    printf '%s' "$1" | sed "s|^~|$HOME|"
}

parse_list() {
    _raw="$1"
    _raw=$(trim "$_raw")

    case "$_raw" in
        \[*\])
            _raw="${_raw#\[}"
            _raw="${_raw%\]}"
            ;;
    esac

    _result=""
    _remaining="$_raw"
    while [ -n "$_remaining" ]; do
        case "$_remaining" in
            *,*)
                _item="${_remaining%%,*}"
                _remaining="${_remaining#*,}"
                ;;
            *)
                _item="$_remaining"
                _remaining=""
                ;;
        esac
        _item=$(trim "$_item")
        [ -z "$_item" ] && continue
        if [ -n "$_result" ]; then
            _result="${_result}:${_item}"
        else
            _result="$_item"
        fi
    done
    printf '%s' "$_result"
}

check_config() {
    if [ -z "$CONFIG_FILE" ] || [ ! -f "$CONFIG_FILE" ]; then
        err "No config file found."
        err "Run 'cf-setup' to initialize your configuration."
        return 1
    fi
    return 0
}

show_help() {
    cat << EOF
EasyConfig $VERSION

Usage: cf [OPTIONS] <name> [command]

Arguments:
  <name>      Name or path of config file to open
  [command]   Command to run on the target (default: editor)

Options:
  -r, --refresh           Skip cache, re-search for target
  --help                  Show this help message
  --version               Show version
  --list                  List all configured targets
  --config restore        Restore all default settings
  --config restore SECTION
                          Restore specific section (settings/targets/aliases/cache)

Examples:
  cf nvim                 # Edit neovim config
  cf cf                   # Edit cf config
  cf fish code            # Edit fish config with code
  cf kitty cat            # Print kitty config with cat
  cf kitty 'wc -l'        # Count lines in kitty config
  cf kitty 'rm -rf'       # Delete kitty config
  cf -r kitty             # Skip cache, re-search for kitty
  cf --list               # Show all targets
  cf --config restore     # Restore whole config
  cf --config restore settings
                          # Restore only settings section
EOF
}

list_targets() {
    check_config || return 1

    printf 'Config Path:'
    _remaining="$CONFIG_PATH"
    while [ -n "$_remaining" ]; do
        case "$_remaining" in
            *:*)
                _path="${_remaining%%:*}"
                _remaining="${_remaining#*:}"
                ;;
            *)
                _path="$_remaining"
                _remaining=""
                ;;
        esac
        printf '\n  %s' "$_path"
    done
    printf '\n\n'

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

reset_defaults() {
    section="$1"
    user_config_file="${HOME}/.config/easy-config/config.conf"
    config_dir="$(dirname "$user_config_file")"

    mkdir -p "$config_dir"

    if [ ! -f "$DEFAULT_CONFIG" ]; then
        err "Default config not found at $DEFAULT_CONFIG"
        err "Please ensure config.conf.default is installed"
        return 1
    fi

    if [ -z "$section" ]; then
        cp "$DEFAULT_CONFIG" "$user_config_file"
        echo "Restored all default settings"
        return 0
    fi

    case "$section" in
        settings|targets|aliases|cache)
            if [ -f "$user_config_file" ]; then
                cp "$user_config_file" "$user_config_file.bak"
                _rebuild_config "$section" "$user_config_file" "$DEFAULT_CONFIG"
                echo "Restored [$section] section (backup at config.conf.bak)"
            else
                cp "$DEFAULT_CONFIG" "$user_config_file"
                echo "No existing config found; copied defaults"
            fi
            ;;
        *)
            err "Unknown section: $section"
            err "Valid sections: settings, targets, aliases, cache"
            return 1
            ;;
    esac
}

_rebuild_config() {
    _section="$1"
    _current="$2"
    _defaults="$3"
    _tmpfile="${_current}.new"

    _default_section=$(sed -n "/^\\[${_section}\\]/,/^\\[/p" "$_defaults" | sed '${ /^\[/d }')

    _in_skip=0
    _inserted=0
    : > "$_tmpfile"

    while IFS= read -r _line || [ -n "$_line" ]; do
        case "$_line" in
            "[$_section]"*)
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

    if [ $_inserted -eq 0 ]; then
        printf '\n%s\n' "$_default_section" >> "$_tmpfile"
    fi

    mv "$_tmpfile" "$_current"
}

load_config() {
    [ -z "$CONFIG_FILE" ] && return
    [ ! -f "$CONFIG_FILE" ] && return

    _current_section=""
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "["*"]")
                _current_section="${line#\[}"
                _current_section="${_current_section%\]}"
                continue
                ;;
        esac

        _key="${line%%=*}"
        _val="${line#*=}"
        _key=$(trim "$_key")
        _val=$(trim "$_val")

        case "$_current_section" in
            settings)
                case "$_key" in
                    default_editor_file)     [ -n "$_val" ] && DEFAULT_EDITOR_FILE="$_val" ;;
                    default_editor_folder)   [ -n "$_val" ] && DEFAULT_EDITOR_FOLDER="$_val" ;;
                    smart_search)            SMART_SEARCH="$_val" ;;
                    config_path)             [ -n "$_val" ] && CONFIG_PATH=$(parse_list "$_val") ;;
                    root_config_path)        [ -n "$_val" ] && ROOT_CONFIG_PATH=$(parse_list "$_val") ;;
                    use_fzf)                 USE_FZF="$_val" ;;
                    max_results)             MAX_RESULTS="$_val" ;;
                    auto_select_first_found_item) AUTO_SELECT="$_val" ;;
                esac
                ;;
            cache)
                case "$_key" in
                    enabled)    CACHE_ENABLED="$_val" ;;
                    cache_path) [ -n "$_val" ] && CACHE_FILE=$(expand_tilde "$_val") ;;
                esac
                ;;
        esac
    done < "$CONFIG_FILE"

    _expanded=""
    _remaining="$CONFIG_PATH"
    while [ -n "$_remaining" ]; do
        case "$_remaining" in
            *:*)
                _path="${_remaining%%:*}"
                _remaining="${_remaining#*:}"
                ;;
            *)
                _path="$_remaining"
                _remaining=""
                ;;
        esac
        _path=$(expand_tilde "$_path")
        if [ -n "$_expanded" ]; then
            _expanded="${_expanded}:${_path}"
        else
            _expanded="$_path"
        fi
    done
    CONFIG_PATH="$_expanded"

    _expanded=""
    _remaining="$ROOT_CONFIG_PATH"
    while [ -n "$_remaining" ]; do
        case "$_remaining" in
            *:*)
                _path="${_remaining%%:*}"
                _remaining="${_remaining#*:}"
                ;;
            *)
                _path="$_remaining"
                _remaining=""
                ;;
        esac
        _path=$(expand_tilde "$_path")
        if [ -n "$_expanded" ]; then
            _expanded="${_expanded}:${_path}"
        else
            _expanded="$_path"
        fi
    done
    ROOT_CONFIG_PATH="$_expanded"
}

get_target() {
    key="$1"

    if [ "$SKIP_CACHE" != "true" ] && [ "$CACHE_ENABLED" = "true" ] && [ -f "$CACHE_FILE" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            case "$line" in
                "${key}="*)
                    value="${line#*=}"
                    value="$(trim "$value")"
                    printf '%s' "$value"
                    return 0
                    ;;
            esac
        done < "$CACHE_FILE"
    fi

    check_config || return 1

    in_targets=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[targets]") in_targets=1; continue ;;
            "["*"]") in_targets=0 ;;
        esac

        if [ $in_targets -eq 1 ] && [ -n "$line" ]; then
            case "$line" in
                "["*"]") ;;
                *)
                    _tkey="${line%%=*}"
                    _tkey=$(trim "$_tkey")
                    if [ "$_tkey" = "$key" ]; then
                        value="${line#*=}"
                        value="$(trim "$value")"
                        printf '%s' "$value"
                        return 0
                    fi
                    ;;
            esac
        fi
    done < "$CONFIG_FILE"

    in_alias=0
    while IFS= read -r line || [ -n "$line" ]; do
        case "$line" in
            "[aliases]") in_alias=1; continue ;;
            "["*"]") in_alias=0 ;;
        esac

        if [ $in_alias -eq 1 ] && [ -n "$line" ]; then
            target_name="${line%%=*}"
            _aliases_raw="${line#*=}"
            target_name=$(trim "$target_name")
            _aliases_raw=$(trim "$_aliases_raw")

            _aliases_parsed=$(parse_list "$_aliases_raw")

            _remaining_a="$_aliases_parsed"
            while [ -n "$_remaining_a" ]; do
                case "$_remaining_a" in
                    *:*)
                        _alias="${_remaining_a%%:*}"
                        _remaining_a="${_remaining_a#*:}"
                        ;;
                    *)
                        _alias="$_remaining_a"
                        _remaining_a=""
                        ;;
                esac
                _alias=$(trim "$_alias")
                if [ "$_alias" = "$key" ]; then
                    get_target "$target_name"
                    return $?
                fi
            done
        fi
    done < "$CONFIG_FILE"

    return 1
}

smart_search() {
    query="$1"

    case "$query" in
        /*)
            _search_paths="/"
            ;;
        ./)
            _search_paths="."
            ;;
        ~*)
            _search_paths="$HOME"
            ;;
        *)
            if [ "$(id -u)" -eq 0 ]; then
                _search_paths="$ROOT_CONFIG_PATH"
            else
                _search_paths="$CONFIG_PATH"
            fi
            ;;
    esac

    results=""

    _remaining="$_search_paths"
    while [ -n "$_remaining" ]; do
        case "$_remaining" in
            *:*)
                search_path="${_remaining%%:*}"
                _remaining="${_remaining#*:}"
                ;;
            *)
                search_path="$_remaining"
                _remaining=""
                ;;
        esac

        if [ ! -d "$search_path" ]; then
            continue
        fi

        case "$query" in
            */*)
                direct_path="$search_path/$query"
                if [ -e "$direct_path" ]; then
                    printf '%s' "$direct_path"
                    return 0
                fi
                ;;
        esac

        case "$query" in
            */*)
                if command -v fd > /dev/null 2>&1; then
                    _found=$(fd -HI -p "$query" "$search_path" 2>/dev/null | head -n "$MAX_RESULTS")
                else
                    _found=$(find "$search_path" -ipath "*$query*" 2>/dev/null | head -n "$MAX_RESULTS")
                fi
                ;;
            *)
                if command -v fd > /dev/null 2>&1; then
                    _found=$(fd -HI "$query" "$search_path" 2>/dev/null | head -n "$MAX_RESULTS")
                else
                    _found=$(find "$search_path" -iname "*$query*" 2>/dev/null | head -n "$MAX_RESULTS")
                fi
                ;;
        esac

        if [ -n "$_found" ]; then
            if [ -n "$results" ]; then
                results="${results}
${_found}"
            else
                results="$_found"
            fi
        fi
    done

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

    i=1
    while IFS= read -r result; do
        printf '%d) %s\n' "$i" "$result" >&2
        i=$((i + 1))
    done <<EOF
$results
EOF

    printf 'Select 1-%s: ' "$count" >&2
    read choice < /dev/tty

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

save_cache() {
    [ "$CACHE_ENABLED" != "true" ] && return

    key="$1"
    path="$2"

    mkdir -p "$(dirname "$CACHE_FILE")"

    if [ -f "$CACHE_FILE" ]; then
        grep -Fv "${key}=" "$CACHE_FILE" > "$CACHE_FILE.tmp" 2>/dev/null || : > "$CACHE_FILE.tmp"
        mv "$CACHE_FILE.tmp" "$CACHE_FILE"
    fi

    printf '%s=%s\n' "$key" "$path" >> "$CACHE_FILE"
}

pick_command() {
    target="$1"
    override_cmd="$2"

    if [ -n "$override_cmd" ]; then
        printf '%s' "$override_cmd"
        return 0
    fi

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

cf() {
    if [ $# -lt 1 ]; then
        show_help
        return 1
    fi

    SKIP_CACHE=false
    while [ $# -gt 0 ]; do
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
            -r|--refresh)
                SKIP_CACHE=true
                shift
                continue
                ;;
            -*)
                err "Unknown option: $1"
                return 1
                ;;
            *)
                break
                ;;
        esac
    done

    if [ $# -lt 1 ]; then
        show_help
        return 1
    fi

    load_config

    name="$1"
    override_cmd="$2"

    # Validate override_cmd - should not be a flag
    if [ -n "$override_cmd" ] && [ "${override_cmd#-}" != "$override_cmd" ]; then
        err "Flags must come before the target name. Use 'cf [OPTIONS] <target> [command]'"
        return 1
    fi

    if [ "$SKIP_CACHE" = "true" ]; then
        target=$(get_target "$name")
        if [ -z "$target" ] && [ "$SMART_SEARCH" = "true" ]; then
            target=$(smart_search "$name")
            if [ -z "$target" ]; then
                return 1
            fi
            save_cache "$name" "$target"
        fi
    else
        target=$(get_target "$name")
        if [ -z "$target" ] && [ "$SMART_SEARCH" = "true" ]; then
            target=$(smart_search "$name")
            if [ -z "$target" ]; then
                return 1
            fi
            save_cache "$name" "$target"
        fi
    fi

    if [ -z "$target" ]; then
        err "Target '$name' not found"
        return 1
    fi

    target=$(expand_tilde "$target")

    cmd=$(pick_command "$target" "$override_cmd")

    _cmd_name="${cmd%% *}"
    if ! command -v "$_cmd_name" > /dev/null 2>&1; then
        err "Command '$_cmd_name' not found in PATH"
        return 1
    fi

    case "$target" in
        */\*) target="${target%/*}" ;;
    esac

    if [ -d "$target" ]; then
        target_type="(folder)"
    elif [ -f "$target" ]; then
        target_type="(file)"
    else
        err "Warning: '$target' does not exist"
        target_type="(unknown)"
    fi

    echo "Opening $target_type with $cmd: $target"

    case "$cmd" in
        *\ *)
            eval "$cmd" '"$target"'
            ;;
        *)
            $cmd "$target"
            ;;
    esac
}

cf "$@"
