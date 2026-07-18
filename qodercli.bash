# bash completion for qodercli
# Generated manually based on qodercli --help

_qodercli() {
    local cur prev words cword
    if declare -F _init_completion >/dev/null 2>&1; then
        _init_completion || return
    else
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        words=("${COMP_WORDS[@]}")
        cword=$COMP_CWORD
    fi

    local -r subcommands="mcp plugins plugin skills skill hooks hook agents agent login commit rollback update remote-control status feedback"
    local -r mcp_subcommands="add add-json remove get list enable disable reset-project-choices"
    local -r plugin_subcommands="list validate install i uninstall remove enable disable update marketplace mp"
    local -r plugin_marketplace_subcommands="add remove rm list update"
    local -r skill_subcommands="list enable disable install link uninstall"
    local -r hook_subcommands="migrate"
    local -r agent_subcommands="list"

    local -r model_choices="auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate"
    local -r output_format_choices="text json stream-json"
    local -r input_format_choices="text stream-json"
    local -r max_output_tokens_choices="16k 32k"
    local -r permission_mode_choices="default accept_edits bypass_permissions dont_ask auto"
    local -r scope_choices="user project local"
    local -r mcp_scope_choices="user local project"
    local -r skill_scope_choices="user workspace"
    local -r transport_choices="stdio sse http ws"
    local -r setting_source_choices="user project local"
    local -r spawn_choices="same-dir worktree"

    local subcmd="" subsubcmd="" thirdcmd=""
    local i j
    for ((i = 1; i < cword; i++)); do
        case "${words[i]}" in
            mcp|plugins|plugin|skills|skill|hooks|hook|agents|agent|login|commit|rollback|update|remote-control|status|feedback)
                subcmd="${words[i]}"
                break
                ;;
        esac
    done

    if [[ -n "$subcmd" ]]; then
        for ((j = i + 1; j < cword; j++)); do
            [[ "${words[j]}" == -* ]] && continue
            case "$subcmd" in
                mcp)
                    case "${words[j]}" in
                        add|add-json|remove|get|list|enable|disable|reset-project-choices)
                            subsubcmd="${words[j]}"
                            break
                            ;;
                    esac
                    ;;
                plugins|plugin)
                    case "${words[j]}" in
                        list|validate|install|i|uninstall|remove|enable|disable|update|marketplace|mp)
                            subsubcmd="${words[j]}"
                            if [[ "$subsubcmd" == "marketplace" || "$subsubcmd" == "mp" ]]; then
                                local k
                                for ((k = j + 1; k < cword; k++)); do
                                    [[ "${words[k]}" == -* ]] && continue
                                    case "${words[k]}" in
                                        add|remove|rm|list|update)
                                            thirdcmd="${words[k]}"
                                            break
                                            ;;
                                    esac
                                done
                            fi
                            break
                            ;;
                    esac
                    ;;
                skills|skill)
                    case "${words[j]}" in
                        list|enable|disable|install|link|uninstall)
                            subsubcmd="${words[j]}"
                            break
                            ;;
                    esac
                    ;;
                hooks|hook)
                    case "${words[j]}" in
                        migrate)
                            subsubcmd="${words[j]}"
                            break
                            ;;
                    esac
                    ;;
                agents|agent)
                    case "${words[j]}" in
                        list)
                            subsubcmd="${words[j]}"
                            break
                            ;;
                    esac
                    ;;
            esac
        done
    fi

    # Handle option arguments that expect a value.
    case "$prev" in
        -m|--model)
            COMPREPLY=($(compgen -W "$model_choices" -- "$cur"))
            return
            ;;
        -o|--output-format|--output)
            if [[ "$subcmd" == "status" || "$subsubcmd" == "list" ]]; then
                COMPREPLY=($(compgen -W "text json" -- "$cur"))
            else
                COMPREPLY=($(compgen -W "$output_format_choices" -- "$cur"))
            fi
            return
            ;;
        --input-format)
            COMPREPLY=($(compgen -W "$input_format_choices" -- "$cur"))
            return
            ;;
        --max-output-tokens)
            COMPREPLY=($(compgen -W "$max_output_tokens_choices" -- "$cur"))
            return
            ;;
        --permission-mode)
            COMPREPLY=($(compgen -W "$permission_mode_choices" -- "$cur"))
            return
            ;;
        --setting-sources)
            COMPREPLY=($(compgen -W "$setting_source_choices" -- "$cur"))
            return
            ;;
        -s|--scope)
            if [[ "$subcmd" == "mcp" ]]; then
                COMPREPLY=($(compgen -W "$mcp_scope_choices" -- "$cur"))
            elif [[ "$subcmd" == "skills" || "$subcmd" == "skill" ]]; then
                case "$subsubcmd" in
                    disable|install|link|uninstall)
                        COMPREPLY=($(compgen -W "$skill_scope_choices" -- "$cur"))
                        ;;
                    *)
                        COMPREPLY=($(compgen -W "$scope_choices" -- "$cur"))
                        ;;
                esac
            else
                COMPREPLY=($(compgen -W "$scope_choices" -- "$cur"))
            fi
            return
            ;;
        -t|--transport)
            COMPREPLY=($(compgen -W "$transport_choices" -- "$cur"))
            return
            ;;
        --spawn)
            COMPREPLY=($(compgen -W "$spawn_choices" -- "$cur"))
            return
            ;;
        -w|--cwd|--workspace|--workdir|--directory|--add-dir|--config-dir|--plugin-dir)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir -d
            else
                COMPREPLY=($(compgen -d -- "$cur"))
            fi
            return
            ;;
        --attachment|--mcp-config|--settings|--images|--file|--headers-helper)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir
            else
                COMPREPLY=($(compgen -f -- "$cur"))
            fi
            return
            ;;
        # These flags take a value but we cannot autocomplete them reliably.
        --reasoning-effort|--context-window|-i|--prompt-interactive|--worktree|\
        --allowed-mcp-server-names|--tools|--allowed-tools|--disallowed-tools|\
        -r|--resume|-n|--name|--session-id|--remote|--remote-session|\
        --teleport|--remote-control|--delete-session|--agent|--agents|\
        --append-system-prompt|--system-prompt|--output-style|--env|-e|\
        --header|-H|--client-id|--callback-port|--capacity|--content|\
        --email|--caller-version|--ide-type|--url|--sparse|--path|--to)
            return
            ;;
    esac

    local -r top_flags="
        -d --debug -m --model --reasoning-effort --context-window --list-models
        -i --prompt-interactive -w --cwd --config-dir --worktree
        --permission-mode --dangerously-skip-permissions
        --allowed-mcp-server-names --tools --allowed-tools --disallowed-tools
        --attachment --plugin-dir -c --continue --fork-session -r --resume
        -n --name --session-id --remote --remote-session --teleport
        --remote-control --list-sessions --delete-session --add-dir
        -o --output-format --input-format --max-output-tokens -p --print
        --no-session-persistence
        --agent --agents --append-system-prompt --system-prompt --output-style
        --mcp-config --strict-mcp-config --setting-sources --settings
        -v --version -h --help
    "
    local -r help_flags="-h --help"

    if [[ "$cur" == -* ]]; then
        case "$subcmd" in
            "")
                COMPREPLY=($(compgen -W "$top_flags" -- "$cur"))
                ;;
            mcp)
                case "$subsubcmd" in
                    add)
                        COMPREPLY=($(compgen -W "-s --scope -t --transport -e --env -H --header --headers-helper --client-id --client-secret --callback-port $help_flags" -- "$cur"))
                        ;;
                    add-json)
                        COMPREPLY=($(compgen -W "-s --scope --client-secret $help_flags" -- "$cur"))
                        ;;
                    get)
                        COMPREPLY=($(compgen -W "-s --scope --json $help_flags" -- "$cur"))
                        ;;
                    remove)
                        COMPREPLY=($(compgen -W "-s --scope $help_flags" -- "$cur"))
                        ;;
                    enable|disable)
                        COMPREPLY=($(compgen -W "--session $help_flags" -- "$cur"))
                        ;;
                    *)
                        COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                        ;;
                esac
                ;;
            plugins|plugin)
                if [[ "$subsubcmd" == "marketplace" || "$subsubcmd" == "mp" ]]; then
                    case "$thirdcmd" in
                        add)
                            COMPREPLY=($(compgen -W "--sparse --scope $help_flags" -- "$cur"))
                            ;;
                        list)
                            COMPREPLY=($(compgen -W "--json $help_flags" -- "$cur"))
                            ;;
                        remove|rm)
                            COMPREPLY=($(compgen -W "--scope $help_flags" -- "$cur"))
                            ;;
                        *)
                            COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                            ;;
                    esac
                else
                    case "$subsubcmd" in
                        list)
                            COMPREPLY=($(compgen -W "--json --available -o --output-format --plugin-dir $help_flags" -- "$cur"))
                            ;;
                        install|i)
                            COMPREPLY=($(compgen -W "-s --scope --json $help_flags" -- "$cur"))
                            ;;
                        uninstall|remove)
                            COMPREPLY=($(compgen -W "-s --scope --keep-data --json $help_flags" -- "$cur"))
                            ;;
                        enable|update)
                            COMPREPLY=($(compgen -W "-s --scope $help_flags" -- "$cur"))
                            ;;
                        disable)
                            COMPREPLY=($(compgen -W "-a --all -s --scope $help_flags" -- "$cur"))
                            ;;
                        *)
                            COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                            ;;
                    esac
                fi
                ;;
            skills|skill)
                case "$subsubcmd" in
                    list)
                        COMPREPLY=($(compgen -W "--all $help_flags" -- "$cur"))
                        ;;
                    disable)
                        COMPREPLY=($(compgen -W "-s --scope $help_flags" -- "$cur"))
                        ;;
                    install)
                        COMPREPLY=($(compgen -W "--scope --path --consent $help_flags" -- "$cur"))
                        ;;
                    link)
                        COMPREPLY=($(compgen -W "--scope --consent $help_flags" -- "$cur"))
                        ;;
                    uninstall)
                        COMPREPLY=($(compgen -W "--scope $help_flags" -- "$cur"))
                        ;;
                    *)
                        COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                        ;;
                esac
                ;;
            hooks|hook)
                case "$subsubcmd" in
                    migrate)
                        COMPREPLY=($(compgen -W "--from-claude $help_flags" -- "$cur"))
                        ;;
                    *)
                        COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                        ;;
                esac
                ;;
            agents|agent)
                COMPREPLY=($(compgen -W "--setting-sources $help_flags" -- "$cur"))
                ;;
            remote-control)
                COMPREPLY=($(compgen -W "--name --spawn --capacity --directory --verbose $help_flags" -- "$cur"))
                ;;
            status)
                COMPREPLY=($(compgen -W "-o --output $help_flags" -- "$cur"))
                ;;
            feedback)
                COMPREPLY=($(compgen -W "-c --content -s --session-id --workdir --email --images --caller-version --ide-type --json $help_flags" -- "$cur"))
                ;;
            rollback)
                COMPREPLY=($(compgen -W "--to $help_flags" -- "$cur"))
                ;;
            update)
                COMPREPLY=($(compgen -W "--check $help_flags" -- "$cur"))
                ;;
            commit)
                COMPREPLY=($(compgen -W "-m --message -w --workspace --hook $help_flags" -- "$cur"))
                ;;
            *)
                COMPREPLY=($(compgen -W "$help_flags" -- "$cur"))
                ;;
        esac
        return
    fi

    case "$subcmd" in
        "")
            COMPREPLY=($(compgen -W "$subcommands" -- "$cur"))
            ;;
        mcp)
            if [[ -z "$subsubcmd" ]]; then
                COMPREPLY=($(compgen -W "$mcp_subcommands" -- "$cur"))
            fi
            ;;
        plugins|plugin)
            if [[ -z "$subsubcmd" ]]; then
                COMPREPLY=($(compgen -W "$plugin_subcommands" -- "$cur"))
            elif [[ ( "$subsubcmd" == "marketplace" || "$subsubcmd" == "mp" ) && -z "$thirdcmd" ]]; then
                COMPREPLY=($(compgen -W "$plugin_marketplace_subcommands" -- "$cur"))
            elif [[ "$subsubcmd" == "validate" ]]; then
                COMPREPLY=($(compgen -d -- "$cur"))
            fi
            ;;
        skills|skill)
            if [[ -z "$subsubcmd" ]]; then
                COMPREPLY=($(compgen -W "$skill_subcommands" -- "$cur"))
            elif [[ "$subsubcmd" == "link" ]]; then
                COMPREPLY=($(compgen -d -- "$cur"))
            fi
            ;;
        hooks|hook)
            if [[ -z "$subsubcmd" ]]; then
                COMPREPLY=($(compgen -W "$hook_subcommands" -- "$cur"))
            fi
            ;;
        agents|agent)
            if [[ -z "$subsubcmd" ]]; then
                COMPREPLY=($(compgen -W "$agent_subcommands" -- "$cur"))
            fi
            ;;
    esac
}

complete -F _qodercli qodercli
