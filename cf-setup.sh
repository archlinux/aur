#!/bin/sh

# cf-setup: First-run setup and migration for EasyConfig (cf)
# Copies system config to user directory, handles .ini → .conf migration

VERSION="1.0.2"

USER_CONFIG_DIR="${HOME}/.config/easy-config"
USER_CONFIG_FILE="${USER_CONFIG_DIR}/config.conf"
OLD_CONFIG_FILE="${USER_CONFIG_DIR}/config.ini"

# System locations
SYSTEM_CONFIG="/etc/easy-config/config.conf"
SYSTEM_DEFAULT="/usr/share/easy-config/config.conf.default"

err() {
    printf 'cf-setup: %s\n' "$*" >&2
}

info() {
    printf '%s\n' "$*"
}

# Read config_version from a config file (returns 0 if not found)
get_config_version() {
    _file="$1"
    [ ! -f "$_file" ] && printf '0' && return

    _in_version=0
    while IFS= read -r _line || [ -n "$_line" ]; do
        case "$_line" in
            "[version]") _in_version=1; continue ;;
            "["*"]") _in_version=0 ;;
        esac
        if [ $_in_version -eq 1 ]; then
            case "$_line" in
                config_version=*)
                    _val="${_line#config_version=}"
                    # trim whitespace
                    _val="${_val#"${_val%%[![:space:]]*}"}"
                    _val="${_val%"${_val##*[![:space:]]}"}"
                    printf '%s' "$_val"
                    return
                    ;;
            esac
        fi
    done < "$_file"
    printf '0'
}

# Find the best source config (system or default)
get_source_config() {
    if [ -f "$SYSTEM_CONFIG" ]; then
        printf '%s' "$SYSTEM_CONFIG"
    elif [ -f "$SYSTEM_DEFAULT" ]; then
        printf '%s' "$SYSTEM_DEFAULT"
    else
        printf ''
    fi
}

# Prompt user for config upgrade action
prompt_config_upgrade() {
    _local_ver="$1"
    _new_ver="$2"
    _source="$3"

    info "Config version mismatch:"
    info "  Local:  v${_local_ver}"
    info "  New:    v${_new_ver}"
    info ""
    info "What would you like to do?"
    info "  1) Backup current config to .old and load new config (default)"
    info "  2) Replace current config (no backup)"
    info "  3) Ignore (keep current config)"
    printf 'Choice [1]: '
    read _choice < /dev/tty 2>/dev/null || _choice="1"

    # Default to 1 if empty
    [ -z "$_choice" ] && _choice="1"

    case "$_choice" in
        1)
            mv "$USER_CONFIG_FILE" "${USER_CONFIG_FILE}.old"
            cp "$_source" "$USER_CONFIG_FILE"
            info "Backed up old config → ${USER_CONFIG_FILE}.old"
            info "Loaded new config → $USER_CONFIG_FILE"
            ;;
        2)
            cp "$_source" "$USER_CONFIG_FILE"
            info "Replaced config → $USER_CONFIG_FILE"
            ;;
        3)
            info "Keeping current config (v${_local_ver})."
            ;;
        *)
            info "Invalid choice, defaulting to option 1."
            mv "$USER_CONFIG_FILE" "${USER_CONFIG_FILE}.old"
            cp "$_source" "$USER_CONFIG_FILE"
            info "Backed up old config → ${USER_CONFIG_FILE}.old"
            info "Loaded new config → $USER_CONFIG_FILE"
            ;;
    esac
}

# Migrate .ini → .conf if needed
migrate_ini_to_conf() {
    if [ -f "$OLD_CONFIG_FILE" ] && [ ! -f "$USER_CONFIG_FILE" ]; then
        info "Migrating config.ini → config.conf"
        mv "$OLD_CONFIG_FILE" "$USER_CONFIG_FILE"
        info "  Renamed: $OLD_CONFIG_FILE → $USER_CONFIG_FILE"
        return 0
    fi
    return 1
}

# Migrate old cache file too
migrate_cache() {
    old_cache="${USER_CONFIG_DIR}/cache.ini"
    new_cache="${USER_CONFIG_DIR}/cache.conf"
    if [ -f "$old_cache" ] && [ ! -f "$new_cache" ]; then
        mv "$old_cache" "$new_cache"
        info "  Renamed: $old_cache → $new_cache"
    fi
}

# Copy system config to user directory
init_user_config() {
    mkdir -p "$USER_CONFIG_DIR"

    # Try migration first
    migrate_ini_to_conf
    migrate_cache

    # If user config still doesn't exist, copy from system
    if [ ! -f "$USER_CONFIG_FILE" ]; then
        if [ -f "$SYSTEM_CONFIG" ]; then
            cp "$SYSTEM_CONFIG" "$USER_CONFIG_FILE"
            info "Created user config from system config:"
            info "  $USER_CONFIG_FILE"
        elif [ -f "$SYSTEM_DEFAULT" ]; then
            cp "$SYSTEM_DEFAULT" "$USER_CONFIG_FILE"
            info "Created user config from defaults:"
            info "  $USER_CONFIG_FILE"
        else
            err "No system config found at:"
            err "  $SYSTEM_CONFIG"
            err "  $SYSTEM_DEFAULT"
            err "Please reinstall easy-config or create config manually."
            return 1
        fi
    else
        # Config exists — check version
        _source=$(get_source_config)
        if [ -n "$_source" ]; then
            _local_ver=$(get_config_version "$USER_CONFIG_FILE")
            _new_ver=$(get_config_version "$_source")
            if [ "$_local_ver" -lt "$_new_ver" ] 2>/dev/null; then
                prompt_config_upgrade "$_local_ver" "$_new_ver" "$_source"
            else
                info "User config is up to date (v${_local_ver}):"
                info "  $USER_CONFIG_FILE"
            fi
        else
            info "User config already exists:"
            info "  $USER_CONFIG_FILE"
        fi
    fi

    return 0
}

# -------- MAIN --------
case "$1" in
    --help|-h)
        cat << EOF
cf-setup $VERSION

First-run setup and migration tool for EasyConfig (cf).

Usage: cf-setup [OPTIONS]

Options:
  --help, -h      Show this help message
  --version, -v   Show version
  --migrate       Only run .ini → .conf migration
  --force         Force re-copy from system config (overwrites user config)

Without options, runs full setup: migration + config initialization.
EOF
        ;;
    --version|-v)
        echo "cf-setup version $VERSION"
        ;;
    --migrate)
        mkdir -p "$USER_CONFIG_DIR"
        if migrate_ini_to_conf; then
            migrate_cache
            info "Migration complete."
        else
            info "Nothing to migrate."
        fi
        ;;
    --force)
        mkdir -p "$USER_CONFIG_DIR"
        if [ -f "$SYSTEM_CONFIG" ]; then
            cp "$SYSTEM_CONFIG" "$USER_CONFIG_FILE"
            info "Force-copied system config → $USER_CONFIG_FILE"
        elif [ -f "$SYSTEM_DEFAULT" ]; then
            cp "$SYSTEM_DEFAULT" "$USER_CONFIG_FILE"
            info "Force-copied default config → $USER_CONFIG_FILE"
        else
            err "No system config found to copy."
            exit 1
        fi
        ;;
    "")
        init_user_config
        ;;
    *)
        err "Unknown option: $1"
        err "Run 'cf-setup --help' for usage."
        exit 1
        ;;
esac
