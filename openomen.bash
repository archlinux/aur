# Bash completion for openomen

_openomen_fan() {
    local commands="max auto toggle status"
    COMPREPLY=($(compgen -W "$commands" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_openomen_power() {
    local commands="status set apply list"
    COMPREPLY=($(compgen -W "$commands" -- "${COMP_WORDS[COMP_CWORD]}"))
}

_openomen() {
    local cur prev commands
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    commands="fan cpu gpu stats info power doctor update"

    case ${prev} in
        openomen)
            COMPREPLY=($(compgen -W "$commands -h --help -v --version" -- ${cur}))
            return 0
            ;;
        fan)
            _openomen_fan
            return 0
            ;;
        power)
            _openomen_power
            return 0
            ;;
        stats)
            COMPREPLY=($(compgen -W "-w --watch -h --help" -- ${cur}))
            return 0
            ;;
    esac

    case ${cur} in
        *)
            COMPREPLY=($(compgen -W "$commands" -- ${cur}))
            return 0
            ;;
    esac
}

complete -F _openomen openomen
