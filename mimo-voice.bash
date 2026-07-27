# Bash completion for mimo-voice

_mimo_voice() {
    local cur prev voices options
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    voices="mimo_default 冰糖 茉莉 苏打 白桦 Mia Chloe Milo Dean"
    options="-l --list -s --set -t --test -c --current -h --help"

    case ${prev} in
        -s|--set)
            COMPREPLY=($(compgen -W "$voices" -- ${cur}))
            return 0
            ;;
    esac

    case ${cur} in
        -*)
            COMPREPLY=($(compgen -W "$options" -- ${cur}))
            return 0
            ;;
        *)
            COMPREPLY=($(compgen -W "$options $voices" -- ${cur}))
            return 0
            ;;
    esac
}

complete -F _mimo_voice mimo-voice
