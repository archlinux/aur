#compdef bitrise

_bitrise() {
    local state
    local -a opts
    if ! opts=( $(bitrise workflows --id-only 2> /dev/null) ); then
        opts=( )
    fi

    _arguments \
        '1: :->subcommand' \
        '2: :->workflow_name'

    case ${state} in
        (subcommand) _arguments '1:wf:(run)' ;;
	    (workflow_name) compadd -Q "$@" ${opts}
    esac
}

_bitrise "$@"

