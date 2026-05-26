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

    local -r subcommands="mcp plugins plugin skills skill hooks hook agents agent login commit rollback update external remote-control status feedback wiki"
    local -r mcp_subcommands="add auth get list remove"

    local -r model_choices="auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate"
    local -r output_format_choices="text json stream-json"
    local -r input_format_choices="text stream-json"
    local -r max_output_tokens_choices="16k 32k"
    local -r permission_mode_choices="default accept_edits bypass_permissions dont_ask plan auto"

    # Determine which subcommand (if any) has been given
    local subcmd="" mcp_subcmd=""
    local i
    for ((i = 1; i < cword; i++)); do
        case "${words[i]}" in
            mcp|plugins|plugin|skills|skill|hooks|hook|agents|agent|login|commit|rollback|update|external|remote-control|status|feedback|wiki)
                subcmd="${words[i]}"
                # Look for mcp subcommand
                if [[ "$subcmd" == "mcp" ]]; then
                    for ((i++; i < cword; i++)); do
                        case "${words[i]}" in
                            add|auth|get|list|remove)
                                mcp_subcmd="${words[i]}"
                                break
                                ;;
                        esac
                    done
                fi
                break
                ;;
        esac
    done

    # Handle option arguments that expect a value
    case "$prev" in
        -m|--model)
            COMPREPLY=($(compgen -W "$model_choices" -- "$cur"))
            return
            ;;
        -o|--output-format)
            COMPREPLY=($(compgen -W "$output_format_choices" -- "$cur"))
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
        -w|--cwd)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir -d
            else
                COMPREPLY=($(compgen -d -- "$cur"))
            fi
            return
            ;;
        --attachment|--plugin-dir|--mcp-config|--settings)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir
            else
                COMPREPLY=($(compgen -f -- "$cur"))
            fi
            return
            ;;
        # These flags take a value but we can't autocomplete them
        --reasoning-effort|--context-window|-i|--prompt-interactive|--worktree|\
        --allowed-mcp-server-names|--tools|--allowed-tools|--disallowed-tools|\
        --add-dir|-r|--resume|-n|--name|--session-id|--remote|--remote-session|\
        --teleport|--remote-control|--delete-session|--agent|--agents|\
        --append-system-prompt|--system-prompt|--output-style|--setting-sources)
            return
            ;;
    esac

    case "$subcmd" in
        "")
            # Top level: complete subcommands or flags
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "
                    -d --debug -m --model --reasoning-effort --context-window
                    -i --prompt-interactive -w --cwd --worktree --permission-mode
                    --dangerously-skip-permissions --allowed-mcp-server-names
                    --tools --allowed-tools --disallowed-tools --attachment
                    --plugin-dir -c --continue --fork-session -r --resume
                    -n --name --session-id --remote --remote-session --teleport
                    --remote-control --list-sessions --delete-session --add-dir
                    -o --output-format --input-format --max-output-tokens
                    -p --print --agent --agents --append-system-prompt
                    --system-prompt --output-style --mcp-config --strict-mcp-config
                    --setting-sources --settings -v --version -h --help
                " -- "$cur"))
            else
                COMPREPLY=($(compgen -W "$subcommands" -- "$cur"))
            fi
            ;;
        mcp)
            case "$mcp_subcmd" in
                "")
                    if [[ "$cur" == -* ]]; then
                        COMPREPLY=($(compgen -W "-h --help -v --version -w --cwd" -- "$cur"))
                    else
                        COMPREPLY=($(compgen -W "$mcp_subcommands" -- "$cur"))
                    fi
                    ;;
                add|auth|get|list|remove)
                    COMPREPLY=($(compgen -W "-h --help -v --version -w --cwd" -- "$cur"))
                    ;;
            esac
            ;;
        plugins|plugin|skills|skill|hooks|hook|agents|agent|login|commit|rollback|update|external|remote-control|status|feedback|wiki)
            COMPREPLY=($(compgen -W "-h --help -v --version -w --cwd" -- "$cur"))
            ;;
    esac
}

complete -F _qodercli qodercli