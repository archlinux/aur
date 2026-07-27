# Bash completion for mimo (MiMo Code)

_mimo() {
    local cur prev commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands="completion acp mcp run debug providers agent upgrade uninstall serve models stats export import github pr session plugin db"

    case ${prev} in
        mimo)
            COMPREPLY=($(compgen -W "$commands -h --help -v --version -m --model -c --continue -s --session --agent --never-ask --trust" -- ${cur}))
            return 0
            ;;
        providers)
            COMPREPLY=($(compgen -W "login logout list whoami" -- ${cur}))
            return 0
            ;;
        agent)
            COMPREPLY=($(compgen -W "create list" -- ${cur}))
            return 0
            ;;
        session)
            COMPREPLY=($(compgen -W "list" -- ${cur}))
            return 0
            ;;
        models)
            COMPREPLY=($(compgen -W "xiaomi openai anthropic deepseek" -- ${cur}))
            return 0
            ;;
        upgrade)
            COMPREPLY=($(compgen -W "--method" -- ${cur}))
            return 0
            ;;
        mcp)
            COMPREPLY=($(compgen -W "list" -- ${cur}))
            return 0
            ;;
        db)
            COMPREPLY=($(compgen -W "--help" -- ${cur}))
            return 0
            ;;
    esac

    case ${cur} in
        -*)
            COMPREPLY=($(compgen -W "-h --help -v --version -m --model -c --continue -s --session --agent --never-ask --trust --print-logs --log-level --pure --port --hostname --mdns --cors --no-auth" -- ${cur}))
            return 0
            ;;
        *)
            COMPREPLY=($(compgen -W "$commands" -- ${cur}))
            return 0
            ;;
    esac
}

complete -F _mimo mimo
