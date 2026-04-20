# Bash completion for forge-code
# Installed to: /usr/share/bash-completion/completions/forge-code

_forge_code() {
    local cur prev words cword
    _init_completion || return

    local -a commands=(
        new conversation clone retry compact
        commit commit-preview agent model config-model
        config-provider config-reasoning-effort config-commit-model
        config-reload info config config-edit tools skill
        suggest edit copy dump dump-html rename
        ask plan sage muse
    )

    local -a agent_names=(forge sage muse)

    # Subcommand completion
    if [[ $cword -eq 1 ]]; then
        COMPREPLY=($(compgen -W "${commands[*]}" -- "$cur"))
        return
    fi

    # Agent-specific argument completion
    case "${words[1]}" in
        agent)
            if [[ $cword -eq 2 ]]; then
                COMPREPLY=($(compgen -W "${agent_names[*]}" -- "$cur"))
            fi
            ;;
        model|config-model|config-commit-model|config-suggest-model)
            # Dynamic — would need provider API, fall through to file completion
            ;;
        conversation)
            if [[ $cword -eq 2 ]]; then
                COMPREPLY=($(compgen -W "-" -- "$cur"))
            fi
            ;;
    esac
}

complete -F _forge_code forge-code
complete -F _forge_code forge
