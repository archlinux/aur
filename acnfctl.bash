#!/usr/bin/env bash

# __________________________
# acnfctl - ACNF Management Tool
# __________________________
        
(

    set -e

    ACNF_INSTALL_DIR=${ACNF_INSTALL_DIR:-"/usr/share/acnf"}
    ACNF_HOOK_DIR="${ACNF_HOOK_DIR:-"$ACNF_INSTALL_DIR/hooks"}"

    export TEXTDOMAIN=acnfctl
    export TEXTDOMAINDIR="${TEXTDOMAINDIR:-/usr/share/locale}"
    . gettext.sh

    if ! command -v gettext &> /dev/null; then
        gettext() { echo -n "$1"; }
    fi

    IFS=':' read -ra HOOK_DIRS <<< "$ACNF_HOOK_DIR"


    each_hook_dir() {
        for d in "${HOOK_DIRS[@]}"; do
            [[ -n "$d" ]] && echo "$d"
        done
    }

    hook_priority() {
        local base=$(basename "$1")
        [[ "$base" =~ ^([0-9]+)- ]] && echo "${BASH_REMATCH[1]}" || echo "99"
    }

    pretty_hook_name() {
        local base=$(basename "$1")
        local name="${base#*-}"
        echo "${name%.*}"
    }

    print_help() {
        echo
        echo "acnfctl - ACNF Management Tool"
        echo
        echo "$(gettext "Usage"):"
        echo "  $(gettext "acnfctl <command> [options]")"
        echo
        echo "$(gettext "Commands"):"
        printf "  enable [user]      %s\n" "$(gettext "Enable ACNF for current/specified user")"
        printf "  disable [user]     %s\n" "$(gettext "Disable ACNF for current/specified user")"
        printf "  add <file>         %s\n" "$(gettext "Add a hook (stored flat)")"
        printf "  remove <name>      %s\n" "$(gettext "Remove a hook by name")"
        printf "  list               %s\n" "$(gettext "List installed hooks by priority")"
        printf "  help               %s\n" "$(gettext "Show this help message")"
        echo
    }

    cmd_enable() {
        local user="${1:-$USER}"
        local home=$(getent passwd "$user" | cut -d: -f6)
        [[ -z "$home" ]] && { printf "$(gettext "Error: User %s not found.")\n" "$user"; exit 1; }

        printf "$(gettext "=> Enabling ACNF for user: %s")\n" "$user"
        mkdir -p "$home/.local/share/acnf"
        echo "true" > "$home/.local/share/acnf/enabled"

        if ! grep -Eq "source[[:space:]]+\"$ACNF_INSTALL_DIR/handler.bash\"" "$home/.bashrc"; then
            printf "$(gettext "First time for %s... Setting up %s/.bashrc.")\n" "$user" "$home"
            echo \
    "if [[ \$(cat $home/.local/share/acnf/enabled 2>/dev/null) == \"true\" ]]; then
        source \"$ACNF_INSTALL_DIR/handler.bash\"
    fi" >> $home/.bashrc
            
        fi

    }

    cmd_disable() {
        local user="${1:-$USER}"
        local home=$(getent passwd "$user" | cut -d: -f6)
        [[ -z "$home" ]] && { printf "$(gettext "Error: User %s not found.")\n" "$user"; exit 1; }

        printf "$(gettext "=> Disabling ACNF for user: %s")\n" "$user"
        mkdir -p "$home/.local/share/acnf"
        echo "false" > "$home/.local/share/acnf/enabled"
    }

    cmd_add() {

        local file="$1"
        [[ -z "$file" ]] && { printf "$(gettext "Error: No hook file specified.")\n"; exit 1; }

        # Resolve file
        if [[ ! -f "$file" ]]; then
            local found=$(find "$(dirname "$file")" -maxdepth 1 -type f \
                -regextype posix-extended \
                -regex ".*/([0-9]+-)?$(basename "$file")(\.sh|\.bash)$" | head -n 1)
            [[ -z "$found" ]] && { printf "$(gettext "Error: Hook not found: %s")\n" "$file"; exit 1; }
            file="$found"
        fi

        if [[ ! "$file" =~ \.(sh|bash)$ ]]; then
            printf "$(gettext "Error: Only .sh or .bash scripts allowed.")\n"
            exit 1
        fi

        # Find first writable hook dir
        local target_dir=""
        for d in $(each_hook_dir); do
            if [[ -w "$d" ]]; then
                target_dir="$d"
                break
            elif [[ ! -e "$d" ]]; then
                if mkdir -p "$d" 2>/dev/null; then
                    target_dir="$d"
                    break
                fi
            fi

        done

        [[ -z "$target_dir" ]] && {
            echo "$(gettext "Error: No writable hook directory found. Add an writable path to ACNF_HOOK_DIR.")"
            exit 1
        }

        local target_name=$(basename "$file")
        local target="$target_dir/$target_name"

        [[ -f "$target" ]] && { printf "$(gettext "Error: Hook is already installed.")\n"; exit 1; }

        cp "$file" "$target"
        chmod +x "$target"

        printf "$(gettext "=> Hook added to %s: %s (Priority: %s)")\n" \
            "$target_dir" "$target_name" "$(hook_priority "$target_name")"
    }


    cmd_remove() {
        local name="$1"
        [[ -z "$name" ]] && { printf "$(gettext "Error: Missing hook name.")\n"; exit 1; }

        local target=""
        for d in $(each_hook_dir); do
            local found=$(find "$d" -maxdepth 1 -type f \
                -regextype posix-extended \
                -regex ".*/([0-9]+-)?$name(\.sh|\.bash)$" | head -n 1)
            if [[ -n "$found" ]]; then
                target="$found"
                break
            fi
        done

        if [[ -n "$target" ]]; then
            local bname=$(basename "$target")
            rm "$target"
            printf "$(gettext "=> Hook removed: %s")\n" "$bname"
        else
            printf "$(gettext "Error: Hook not found: %s")\n" "$name"
            exit 1
        fi
    }


    cmd_list() {
        local hooks=()

        for d in $(each_hook_dir); do
            [[ -d "$d" ]] || continue
            while IFS= read -r hook; do
                hooks+=("$hook")
            done < <(find "$d" -maxdepth 1 -type f \( -name "*.sh" -o -name "*.bash" \))
        done

        if [[ ${#hooks[@]} -eq 0 ]]; then
            printf "$(gettext "No hooks installed.")\n"
            return
        fi

        printf "$(gettext "=> Installed hooks (from all hook dirs):")\n"

        printf "%s\n" "${hooks[@]}" | sort -V | while read -r hook; do
            printf "  [%s] %s (%s)\n" \
                "$(hook_priority "$hook")" \
                "$(pretty_hook_name "$hook")" \
                "$(dirname "$hook")"
        done
    }


    if [[ $2 == "root" && "$EUID" -ne 0 ]]; then
        echo "$(gettext "Please run as root to manage root's acnf.")"
        exit 1
    fi

    case "$1" in
        enable)  shift; cmd_enable "$@" ;;
        disable) shift; cmd_disable "$@" ;;
        add)     shift; cmd_add "$@" ;;
        remove)  shift; cmd_remove "$@" ;;
        list)    cmd_list ;;
        help|"") print_help ;;
        *)
            printf "$(gettext "Error: Unknown command: %s")\n" "$1"
            print_help
            exit 1
            ;;
    esac
)