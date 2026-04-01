#!/usr/bin/env bash

command_not_found_handle() {
    (
        export TEXTDOMAIN="acnf_arch_handler"
        . gettext.sh

        local RED="\e[31m"
        local GREEN="\e[32m"
        local YELLOW="\e[33m"
        local BLUE="\e[34m"
        local BOLD="\e[1m"
        local RESET="\e[0m"
        
        local cmd="$1"

        echo -e "$(eval_gettext "Command '\${BOLD}\${cmd}\${RESET}' not found.")"
        echo    
        echo "$(gettext "Searching for Packages that provide it...")"
        echo

        local package_manager="${ACNF_PACKAGE_MANAGER:-pacman}"
        local package_manager_cmd_prefix="${ACNF_PACKAGE_MANAGER_CMD_PREFIX:-sudo}"

        local matches="$($package_manager -Fq "/usr/bin/$cmd" 2>/dev/null)"

        if [[ -n "$matches" ]]; then
            echo -e "$(eval_gettext "Inside the \${BOLD}official Repos\${RESET}, \$cmd was found, and...")"
            echo
            echo "$matches" | sort -u | while read -r pkg; do
                local dsc="$($package_manager -Si "$pkg" | head -n 4 | tail -n 1 | cut -d':' -f2)"
                echo -e "  - ${BLUE}$pkg${RESET} $(gettext "provides it"):${BOLD}$dsc${RESET}"
                
                if [[ $(set -- $matches; echo $#) -eq 1 ]]; then
                    pkg="${pkg##*/}"
                fi
                
                echo "      $(gettext "install it using")"
                echo "           '$package_manager_cmd_prefix $package_manager -S $pkg'"
                echo
            done
        else
            # HOOK SYSTEM (multi-directory)
            local ACNF_HOOK_DIRS="${ACNF_HOOK_DIR:-"$(dirname "${BASH_SOURCE[0]}")/hooks"}"
            IFS=':' read -ra HOOK_DIRS <<< "$ACNF_HOOK_DIRS"

            local hooks=()

            # Collect hooks from all directories
            for d in "${HOOK_DIRS[@]}"; do
                [[ -d "$d" ]] || continue
                while IFS= read -r hook; do
                    hooks+=("$hook")
                done < <(find "$d" -maxdepth 1 -type f \( -name "*.sh" -o -name "*.bash" \))
            done

            local success="false"
            if [[ ${#hooks[@]} -gt 0 ]]; then
                # Sort globally by priority (numeric prefix)
                while read -r hook; do
                    [[ -f "$hook" && -x "$hook" ]] || continue
                    if "$hook" "$cmd"; then
                        success="true"
                        break
                    fi
                done <<< $(printf "%s\n" "${hooks[@]}" | sort -V)
            else
                echo "$(eval_gettext "No hooks found in any ACNF_HOOK_DIR directory.")"
            fi

            if [[ "$success" == "false" ]]; then
                echo -e "$(eval_gettext "Command '\${BOLD}\${cmd}\${RESET}' not found.")"
            fi

        fi
    )
}
