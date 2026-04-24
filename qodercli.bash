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

    local -r subcommands="commit jobs rm feedback help install mcp status update"
    local -r mcp_subcommands="add auth get list remove"

    local -r model_choices="auto efficient gmodel kmodel lite mmodel performance q35model qmodel ultimate"
    local -r output_format_choices="text json stream-json"
    local -r input_format_choices="text stream-json"
    local -r max_output_tokens_choices="16k 32k"
    local -r scope_choices="local user project"
    local -r transport_choices="stdio sse http streamable-http"

    # Determine which subcommand (if any) has been given
    local subcmd="" mcp_subcmd=""
    local i
    for ((i = 1; i < cword; i++)); do
        case "${words[i]}" in
            commit|jobs|rm|feedback|help|mcp|status|update)
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
        --model)
            COMPREPLY=($(compgen -W "$model_choices" -- "$cur"))
            return
            ;;
        -f|--output-format)
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
        -w|--workspace|--workdir|--path)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir -d
            else
                COMPREPLY=($(compgen -d -- "$cur"))
            fi
            return
            ;;
        --attachment|-i|--images)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir
            else
                COMPREPLY=($(compgen -f -- "$cur"))
            fi
            return
            ;;
        --kubeconfig)
            if declare -F _filedir >/dev/null 2>&1; then
                _filedir
            else
                COMPREPLY=($(compgen -f -- "$cur"))
            fi
            return
            ;;
        -s|--scope)
            COMPREPLY=($(compgen -W "$scope_choices" -- "$cur"))
            return
            ;;
        -t|--transport)
            COMPREPLY=($(compgen -W "$transport_choices" -- "$cur"))
            return
            ;;
        -o|--output)
            COMPREPLY=($(compgen -W "text json" -- "$cur"))
            return
            ;;
        # These flags take a value but we can't autocomplete them
        --agents|--allowed-tools|--disallowed-tools|--branch|--max-turns|\
        -p|--print|-r|--resume|-c|--content|-s|--session|--namespace|\
        -e|--env|-H|--header|--summarize-tool)
            return
            ;;
    esac

    case "$subcmd" in
        "")
            # Top level: complete subcommands or flags
            if [[ "$cur" == -* ]]; then
                COMPREPLY=($(compgen -W "
                    --agents --allowed-tools --attachment --branch
                    -c --continue --dangerously-skip-permissions
                    --disallowed-tools --experimental-mcp-load
                    -h --help --input-format --max-output-tokens
                    --max-turns --model -f --output-format --path
                    -p --print -q --quiet -r --resume --summarize-tool
                    -v --version --with-claude-config -w --workspace
                    --worktree --yolo
                " -- "$cur"))
            else
                COMPREPLY=($(compgen -W "$subcommands" -- "$cur"))
            fi
            ;;
        jobs)
            COMPREPLY=($(compgen -W "-a --all -h --help -v --version -w --workspace" -- "$cur"))
            ;;
        rm)
            COMPREPLY=($(compgen -W "-f --force -h --help --kubeconfig --namespace -v --version -w --workspace" -- "$cur"))
            ;;
        feedback)
            COMPREPLY=($(compgen -W "--caller-version -c --content --email -h --help -i --images --json -s --session --workdir -v --version -w --workspace" -- "$cur"))
            ;;
        commit)
            COMPREPLY=($(compgen -W "-h --help -m --message -v --version -w --workspace" -- "$cur"))
            ;;
        help)
            COMPREPLY=($(compgen -W "$subcommands" -- "$cur"))
            ;;
        status)
            COMPREPLY=($(compgen -W "-h --help -o --output -v --version -w --workspace" -- "$cur"))
            ;;
        update)
            ;;
        install)
            COMPREPLY=($(compgen -W "--force -h --help --quiet -v --version -w --workspace" -- "$cur"))
            ;;
        mcp)
            case "$mcp_subcmd" in
                "")
                    if [[ "$cur" == -* ]]; then
                        COMPREPLY=($(compgen -W "-h --help -v --version -w --workspace" -- "$cur"))
                    else
                        COMPREPLY=($(compgen -W "$mcp_subcommands" -- "$cur"))
                    fi
                    ;;
                add)
                    COMPREPLY=($(compgen -W "-e --env -H --header -h --help -s --scope -t --transport -v --version -w --workspace" -- "$cur"))
                    ;;
                auth|get)
                    COMPREPLY=($(compgen -W "-h --help -v --version -w --workspace" -- "$cur"))
                    ;;
                list)
                    COMPREPLY=($(compgen -W "-h --help -v --version -w --workspace" -- "$cur"))
                    ;;
                remove)
                    COMPREPLY=($(compgen -W "-h --help -s --scope -v --version -w --workspace" -- "$cur"))
                    ;;
            esac
            ;;
    esac
}

complete -F _qodercli qodercli
